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

  final editedNoteEntity = NoteEntity(
    noteId: 1,
    noteTitle: 'Edited Note',
    noteContent: 'Edited Content',
    creationDate: DateTime.now(),
  );


  final editedNoteModel = NoteModel(
    noteTitle: editedNoteEntity.noteTitle,
    noteContent: editedNoteEntity.noteContent,
    creationDate: noteEntity.creationDate,
    lastEditDate: DateTime.now()
  );

  test("on createNote, should save note locally and return Right(noteEntity)", () async {
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

  test("on createNote, should return cache-failure when datasource throws cache-error exception", () async {
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

  test("on getAllNotes, should return list of notes from local datasource", () async {
    when(mockNotesLocalDataSource.getSavedNotes())
        .thenAnswer((_) async => [noteModel]);

    final result = await noteRepositoryImpl.getAllNotes();

    expect(result.isRight(), true);
    result.fold(
      (failure) => fail('Expected success, got failure'),
      (notes) {
        expect(notes.first.noteTitle, 'Test Note');
        expect(notes.length, 1);
      },
    );

    verify(mockNotesLocalDataSource.getSavedNotes()).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });

  test("on getAllNotes, should return cache-failure when datasource throws cache-error exception", () async {
    when(mockNotesLocalDataSource.getSavedNotes())
        .thenThrow(CacheErrorException("Error on getting notes"));

    final result = await noteRepositoryImpl.getAllNotes();

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failures, List<NoteEntity>>>());
    result.fold((failure) => expect(failure.message, "Error on getting notes"),
        (r) => fail("Should not return right"));
    verify(mockNotesLocalDataSource.getSavedNotes()).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });

  test("on editNoteById, should update note locally and return Right(noteEntity)", () async {
    when(mockNotesLocalDataSource.saveEditedNote(editedNoteModel))
        .thenAnswer((_) async {});

    final result = await noteRepositoryImpl.editNoteById(editedNoteEntity);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => throw Exception()), editedNoteEntity);
    verify(
      mockNotesLocalDataSource.saveEditedNote(
        argThat(
          predicate<NoteModel>((model) =>
          model.noteTitle == editedNoteEntity.noteTitle &&
              model.noteContent == editedNoteEntity.noteContent
          ),
        ),
      ),
    ).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });

  test("on editNoteById, should return cache-failure when datasource throws cache-error exception", () async {
    when(mockNotesLocalDataSource.saveEditedNote(any))
        .thenThrow(CacheErrorException("Error on editing note"));

    final result = await noteRepositoryImpl.editNoteById(editedNoteEntity);

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failures, NoteEntity>>());
    result.fold((failure) => expect(failure.message, "Error on editing note"),
            (r) => fail("Should not return right"));
    verify(mockNotesLocalDataSource.saveEditedNote(any)).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });

  test("on deleteNoteById, should delete note locally and return Right(1)", () async {
    when(mockNotesLocalDataSource.deleteNoteById(1))
        .thenAnswer((_) async {});

    final result = await noteRepositoryImpl.deleteNoteById(1);

    expect(result.isRight(), true);
    expect(result.getOrElse(() => throw Exception()), 1);

    verify(mockNotesLocalDataSource.deleteNoteById(1)).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });


  test("on deleteNoteById, should return cache-failure when datasource throws cache-error exception", () async {
    when(mockNotesLocalDataSource.deleteNoteById(1))
        .thenThrow(CacheErrorException("Error on deleting note"));

    final result = await noteRepositoryImpl.deleteNoteById(1);

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failures, int>>());
    result.fold(
      (failure) => expect(failure.message, "Error on deleting note"),
      (r) => fail("Should not return right")
    );
    verify(mockNotesLocalDataSource.deleteNoteById(1)).called(1);
    verifyNoMoreInteractions(mockNotesLocalDataSource);
  });
}