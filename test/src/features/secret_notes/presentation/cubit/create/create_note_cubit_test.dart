import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/create_note_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';
import 'create_note_cubit_test.mocks.dart';

@GenerateMocks([CreateNoteUseCase])
void main() {
  late CreateNoteCubit createNoteCubit;
  late MockCreateNoteUseCase mockCreateNoteUseCase;

  setUp(() {
    mockCreateNoteUseCase = MockCreateNoteUseCase();
    createNoteCubit = CreateNoteCubit(createNoteUseCase: mockCreateNoteUseCase);
  });

  final noteEntity = NoteEntity(
    noteId: 1,
    noteTitle: 'Test Note',
    noteContent: 'Test Content',
    creationDate: DateTime.now(),
  );


  test('GIVEN [CreateNoteCubit] is initialized, WHEN no action is taken, then initial state should be [CreateNoteInitial]', () {
    expect(createNoteCubit.state, CreateNoteInitial());
  });

  test('GIVEN [createNote] succeeds, WHEN [createNote] is called, THEN it should emit loading and success states', () async {
    when(mockCreateNoteUseCase.call(any))
        .thenAnswer((_) async => Right(noteEntity));

    expectLater(
      createNoteCubit.stream,
      emitsInOrder([
        CreateNoteLoading(),
        CreateNoteSuccess(),
      ])
    );
    await createNoteCubit.createNote(noteEntity);
  });

  test('GIVEN [createNote] fails, WHEN [createNote] is called, then it should emit loading and failure states', () async {
    when(mockCreateNoteUseCase.call(any))
        .thenAnswer((_) async => Left(CacheFailure(message: 'Error saving note')));

    expectLater(
        createNoteCubit.stream,
        emitsInOrder([
          CreateNoteLoading(),
          CreateNoteFailure(savingNoteFailure: SavingNoteFailure(message: "Error saving note")),
        ])
    );
    await createNoteCubit.createNote(noteEntity);
  });
}