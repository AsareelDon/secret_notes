import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'package:secret_notes/src/features/secret_notes/data/repositories/note_repository_impl.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'note_repository_impl_test.mocks.dart';

@GenerateMocks([NotesLocalDataSource])
void main() {
  late NoteRepositoryImpl noteRepositoryImpl;
  late MockNotesLocalDataSource mockNotesLocalDataSource;

  setUp(() {
    mockNotesLocalDataSource = MockNotesLocalDataSource();
    noteRepositoryImpl = NoteRepositoryImpl(notesLocalDataSource: mockNotesLocalDataSource);
  });

  final noteEntity = NoteEntity(
    noteId: 1,
    noteTitle: 'Test Note',
    noteContent: 'Test Content',
    creationDate: DateTime.now(),
  );

  final noteModel = NoteModel(
      noteTitle: noteEntity.noteTitle,
      noteContent: noteEntity.noteContent,
      creationDate: noteEntity.creationDate
  );

  test("should save note locally and return Right(noteEntity)", () async {
    when(mockNotesLocalDataSource.saveCreatedNote(any))
        .thenAnswer((_) async {});

    final result = await noteRepositoryImpl.createNote(noteEntity);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => throw Exception()), noteEntity);
    verify(
      mockNotesLocalDataSource.saveCreatedNote(
        argThat(
          predicate<NoteModel>((model) =>
          model.noteTitle == noteEntity.noteTitle &&
              model.noteContent == noteEntity.noteContent
          ),
        ),
      ),
    ).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });

  test("should return cache-failure when datasource throws cache-error exception", () async {
    when(mockNotesLocalDataSource.saveCreatedNote(any))
        .thenThrow(CacheErrorException("Error on saving note"));

    final result = await noteRepositoryImpl.createNote(noteEntity);

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failures, NoteEntity>>());
    result.fold((failure) => expect(failure.message, "Error on saving note"),
        (r) => fail("Should not return right"));
    verify(mockNotesLocalDataSource.saveCreatedNote(any));
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });
}