import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_state.dart';
import 'get_note_cubit_test.mocks.dart';

@GenerateMocks([GetAllNotesUsecase])
void main() {
  late GetNoteCubit getNoteCubit;
  late MockGetAllNotesUsecase mockGetAllNoteUseCase;

  setUp(() {
    mockGetAllNoteUseCase = MockGetAllNotesUsecase();
    getNoteCubit = GetNoteCubit(getAllNotesUsecase: mockGetAllNoteUseCase);
  });

  final List<NoteEntity> mockNotes = [
    NoteEntity(
      noteId: 1,
      noteTitle: 'Grocery List',
      noteContent: 'Milk, Eggs, Bread',
      creationDate: DateTime.parse('2025-01-01 10:00:00'),
      lastEditDate: DateTime.parse('2025-01-01 12:00:00'),
    ),
    NoteEntity(
      noteId: 2,
      noteTitle: 'Flutter Study',
      noteContent: 'Read Bloc and Clean Architecture',
      creationDate: DateTime.parse('2025-01-02 09:30:00'),
      lastEditDate: null,
    ),
    NoteEntity(
      noteId: 3,
      noteTitle: 'Workout Plan',
      noteContent: 'Run 5km, 30 push-ups',
      creationDate: DateTime.parse('2025-01-03 07:00:00'),
      lastEditDate: DateTime.parse('2025-01-03 08:00:00'),
    ),
  ];

  test('initial state should be GetNoteInitial', () {
    expect(getNoteCubit.state, GetNoteInitial());
  });

  group('GetNoteCubit', () {
    test('should emit [GetNoteLoading, GetNoteLoaded] when get all notes is called', () async {
      when(mockGetAllNoteUseCase.call(NoParams()))
          .thenAnswer((_) async => Right(mockNotes));

      getNoteCubit.getAllNotes();

      expect(getNoteCubit.state, GetNoteLoading());
      await untilCalled(mockGetAllNoteUseCase.call(NoParams()));
      expect(getNoteCubit.state, GetNoteLoaded(notes: mockNotes));
    });

    test('should emit [GetNoteLoading, GetNoteFailure] when get all notes fails', () async {
      when(mockGetAllNoteUseCase.call(NoParams()))
          .thenAnswer((_) async => Left(CacheFailure(message: "Error on getting notes")));

      getNoteCubit.getAllNotes();

      expect(getNoteCubit.state, GetNoteLoading());
      await untilCalled(mockGetAllNoteUseCase.call(NoParams()));
      expect(getNoteCubit.state, GetNoteError(message: "Error on getting notes"));
    });
  });
}