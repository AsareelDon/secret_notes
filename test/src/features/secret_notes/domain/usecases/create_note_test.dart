import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/create_note_usecase.dart';
import 'create_note_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  late CreateNoteUseCase useCase;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    useCase = CreateNoteUseCase(noteRepository: mockNoteRepository);
  });

  final createdNotes = NoteEntity(
      noteId: 1,
      noteTitle: "Create Note App",
      noteContent: "Should follow clean architecture and use cubit/bloc for state management",
      creationDate: DateTime.now(),
  );

  final params = NoteParams(noteEntity: createdNotes);
  
  test("should return Failure when creation of note failed.", () async {
    final failure = ServerFailure(message: "Server Failure");

    when(mockNoteRepository.createNote(createdNotes))
        .thenAnswer((_) async => Left(failure));

    final result = await useCase.call(params);

    expect(result, isA<Left<Failures, NoteEntity>>());
    result.fold(
          (f) => expect(f.message, "Server Failure"),
          (_) => fail("Expected Left, got Right"),
    );
    verify(mockNoteRepository.createNote(createdNotes)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });

  test("should return Success(Right) create-notes", () async {
    when(mockNoteRepository.createNote(createdNotes))
        .thenAnswer((_) async => Right(createdNotes));

    final result = await useCase.call(params);

    expect(result, isA<Right<Failures, NoteEntity>>());
    result.fold(
          (_) => fail("Expected Right, got Left"),
          (note) => expect(note, createdNotes),
    );
    verify(mockNoteRepository.createNote(createdNotes)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });
}