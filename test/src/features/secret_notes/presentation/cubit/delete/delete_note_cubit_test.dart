import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/delete_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_state.dart';
import 'delete_note_cubit_test.mocks.dart';

@GenerateMocks([DeleteNoteByIdUseCase])
void main() {
  late MockDeleteNoteByIdUseCase mockDeleteNoteByIdUseCase;
  late DeleteNoteCubit deleteNoteCubit;

  setUp(() {
    mockDeleteNoteByIdUseCase = MockDeleteNoteByIdUseCase();
    deleteNoteCubit = DeleteNoteCubit(deleteNoteByIdUseCase: mockDeleteNoteByIdUseCase);
  });

  final noteResponse = NoteResponse(
      isSuccess: true,
      message: "Note removed successfully",
  );

  test('initial state should be DeleteNoteInitial', () {
    expect(deleteNoteCubit.state, DeleteNoteInitial());
  });

  group('DeleteNoteCubit', () {
    test('should emit [DeleteNoteLoading, DeleteNoteSuccess] when DeleteNoteByIdUseCase is called successfully', () async {
      when(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)))
          .thenAnswer((_) async => const Right(1));

      deleteNoteCubit.deleteNoteById(1);

      expect(deleteNoteCubit.state, DeleteNoteLoading());
      await untilCalled(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)));
      expect(deleteNoteCubit.state, DeleteNoteSuccess(noteResponse: noteResponse));
    });

    test('should emit [DeleteNoteLoading, DeleteNoteFailure] when DeleteNoteByIdUseCase is called unsuccessfully', () async {
      when(mockDeleteNoteByIdUseCase.call(any))
          .thenAnswer((_) async => Left(CacheFailure(message: 'Failed to remove note')));

      deleteNoteCubit.deleteNoteById(1);

      expect(deleteNoteCubit.state, DeleteNoteLoading());
      await untilCalled(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)));
      expect(deleteNoteCubit.state, DeleteNoteFailure(error: 'Failed to remove note'));
    });
  });
}