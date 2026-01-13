import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart';
import 'edit_note_by_id_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  late MockNoteRepository mockNoteRepository;
  late EditNoteByIdUseCase editNoteByIdUseCase;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    editNoteByIdUseCase = EditNoteByIdUseCase(noteRepository: mockNoteRepository);
  });

  final editedNotes = NoteEntity(
    noteId: 1,
    noteTitle: "Edited Note Title",
    noteContent: "Should edit note content",
    creationDate: DateTime.now(),
    lastEditDate: DateTime.now(),
  );


  test('GIVEN note update succeeds, WHEN [EditNoteByIdUseCase] is called, THEN it should return the updated note', () async {
    when(mockNoteRepository.editNoteById(editedNotes))
        .thenAnswer((_) async => Right(editedNotes));

    final result = await editNoteByIdUseCase.call(EditNoteParams(noteEntity: editedNotes));

    expect(result, isA<Right<Failures, NoteEntity>>());
    result.fold(
        (_) => fail("Expected Right but got Left"),
        (editedNote) => expect(editedNote, editedNotes)
    );
    verify(mockNoteRepository.editNoteById(editedNotes)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });

  test('GIVEN note update fails, WHEN [EditNoteByIdUseCase] is called, THEN it should return a Failure', () async {
    when(mockNoteRepository.editNoteById(editedNotes))
        .thenAnswer((_) async => Left(Failures.savingNote(message: 'Failed to update note')));

    final result = await editNoteByIdUseCase.call(EditNoteParams(noteEntity: editedNotes));

    expect(result, isA<Left<Failures, NoteEntity>>());
    result.fold(
        (failure) {
          expect(failure, isA<Failures>());
          expect(failure.message, 'Failed to update note');
        },
        (_) => fail("Expected Left but got Right")
    );
    verify(mockNoteRepository.editNoteById(editedNotes)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });
}