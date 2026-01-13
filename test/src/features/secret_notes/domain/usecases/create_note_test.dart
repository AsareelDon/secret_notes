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
      noteContent: "Example Note Content",
      creationDate: DateTime.now(),
  );

  final params = NoteParams(noteEntity: createdNotes);
  
  test("GIVEN note creation fails, WHEN [CreateNoteUseCase] is called, THEN it should return a Failure", () async {
    when(mockNoteRepository.createNote(createdNotes))
        .thenAnswer((_) async => Left(Failures.savingNote(message: "Failed to create note")));

    final result = await useCase.call(params);

    expect(result, isA<Left<Failures, NoteEntity>>());
    result.fold(
          (f) => expect(f.message, "Failed to create note"),
          (_) => fail("Expected Left, got Right"),
    );
    verify(mockNoteRepository.createNote(createdNotes)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });

  test("GIVEN note creation succeeds, WHEN [CreateNoteUseCase] is called, THEN it should return the created note", () async {
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