import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_state.dart';

import 'edit_note_cubit_test.mocks.dart';

@GenerateMocks([EditNoteByIdUseCase])
void main() {
  late EditNoteCubit editNoteCubit;
  late MockEditNoteByIdUseCase mockEditNoteByIdUseCase;

  setUp(() {
    mockEditNoteByIdUseCase = MockEditNoteByIdUseCase();
    editNoteCubit = EditNoteCubit(editNoteByIdUseCase: mockEditNoteByIdUseCase);
  });

  final noteEntity = NoteEntity(
    noteId: 1,
    noteTitle: 'Test Note',
    noteContent: 'Test Content',
    creationDate: DateTime.now(),
  );

  test('GIVEN [EditNoteCubit] is initialized, WHEN no action is taken, THEN initial state should be [EditNoteInitial]', () {
    expect(editNoteCubit.state, EditNoteInitial());
  });

  group('EditNoteCubit', () {
    test('GIVEN [editNoteById] succeeds, WHEN [editNoteById] is called, THEN it should emit loading and loaded states', () async {
      when(mockEditNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity)))
          .thenAnswer((_) async => Right(noteEntity));

      editNoteCubit.editNoteById(noteEntity);

      expect(editNoteCubit.state, EditNoteLoading());
      await untilCalled(mockEditNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity)));

      expect(editNoteCubit.state, EditNoteLoaded());
    });

    test('GIVEN [editNoteById] fails, WHEN [editNoteById] is called, THEN it should emit loading and error states', () async {
      when(mockEditNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity)))
          .thenAnswer((_) async => Left(SavingNoteFailure(message: "Error on updating note")));

      editNoteCubit.editNoteById(noteEntity);

      expect(editNoteCubit.state, EditNoteLoading());
      await untilCalled(mockEditNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity)));
      expect(editNoteCubit.state, EditNoteError(savingNoteFailure: SavingNoteFailure(message: "Error on updating note")));
    });
  });
}