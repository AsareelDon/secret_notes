import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';
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

  final noteResponse = NoteResponse(
      isSuccess: true,
      message: "Note created successfully",
      noteData: noteEntity
  );

  test('initial state is CreateNoteInitial', () {
    expect(createNoteCubit.state, CreateNoteInitial());
  });

  test('emits CreateNoteSuccess when successful', () async {
    when(mockCreateNoteUseCase.call(any))
        .thenAnswer((_) async => Right(noteEntity));

    expectLater(
      createNoteCubit.stream,
      emitsInOrder([
        CreateNoteLoading(),
        CreateNoteSuccess(noteResponse: noteResponse),
      ])
    );
    await createNoteCubit.createNote(noteEntity);
  });

  test('emits CreateNoteFailure when unsuccessful', () async {
    when(mockCreateNoteUseCase.call(any))
        .thenAnswer((_) async => Left(CacheFailure(message: 'Error saving note')));

    expectLater(
        createNoteCubit.stream,
        emitsInOrder([
          CreateNoteLoading(),
          CreateNoteFailure(error: "Error saving note"),
        ])
    );
    await createNoteCubit.createNote(noteEntity);
  });
}