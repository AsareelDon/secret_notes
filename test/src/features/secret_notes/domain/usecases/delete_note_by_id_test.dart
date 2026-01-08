import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/delete_note_by_id_usecase.dart';
import 'delete_note_by_id_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  late MockNoteRepository mockNoteRepository;
  late DeleteNoteByIdUseCase deleteNoteByIdUseCase;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    deleteNoteByIdUseCase = DeleteNoteByIdUseCase(noteRepository: mockNoteRepository);
  });

  final DeleteNoteParams deleteNoteParams = DeleteNoteParams(noteId: 1);

  test("should return Success(Right) when delete note by id is successful", () async {
    when(mockNoteRepository.deleteNoteById(deleteNoteParams.noteId))
        .thenAnswer((_) async => Right(1));

    final result = await deleteNoteByIdUseCase.call(deleteNoteParams);

    expect(result, isA<Right<Failures, int>>());
    result.fold(
        (_) => fail("Expected Right but got Left"),
        (right) => expect(right, 1)
    );
    verify(mockNoteRepository.deleteNoteById(deleteNoteParams.noteId)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });

  test("should return Failure(Left) when delete note by id fails", () async {
    when(mockNoteRepository.deleteNoteById(deleteNoteParams.noteId))
        .thenAnswer((_) async => Left(ServerFailure(message: "Failed to delete note")));

    final result = await deleteNoteByIdUseCase.call(deleteNoteParams);

    expect(result, isA<Left<Failures, int>>());
    result.fold(
        (left) {
          expect(left, isA<ServerFailure>());
          expect(left.message, "Failed to delete note");
        },
        (_) => fail("Expected Left but got Right")
    );
    verify(mockNoteRepository.deleteNoteById(deleteNoteParams.noteId)).called(1);
    verifyNoMoreInteractions(mockNoteRepository);
  });
}
