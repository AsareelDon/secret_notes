import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
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


  test('GIVEN [DeleteNoteCubit] is initialized, WHEN no action is taken, THEN initial state should be [DeleteNoteInitial]', () {
    expect(deleteNoteCubit.state, DeleteNoteInitial());
  });

  group('DeleteNoteCubit', () {
    test('GIVEN [deleteNoteById] succeeds, WHEN [deleteNoteById] is called, THEN it should emit loading and success states', () async {
      when(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)))
          .thenAnswer((_) async => const Right(1));

      deleteNoteCubit.deleteNoteById(1);

      expect(deleteNoteCubit.state, DeleteNoteLoading());
      await untilCalled(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)));
      expect(deleteNoteCubit.state, DeleteNoteSuccess());
    });

    test('GIVEN [deleteNoteById] fails, WHEN [deleteNoteById] is called, THEN it should emit loading and failure states', () async {
      when(mockDeleteNoteByIdUseCase.call(any))
          .thenAnswer((_) async => Left(CacheFailure(message: 'Failed to remove note')));

      deleteNoteCubit.deleteNoteById(1);

      expect(deleteNoteCubit.state, DeleteNoteLoading());
      await untilCalled(mockDeleteNoteByIdUseCase.call(DeleteNoteParams(noteId: 1)));
      expect(deleteNoteCubit.state, DeleteNoteFailure(error: 'Failed to remove note'));
    });
  });
}