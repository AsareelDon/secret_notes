import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/get_all_notes_usecase.dart';
import 'get_all_notes_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  late GetAllNotesUsecase useCase;
  late MockNoteRepository mockNoteRepository;

  setUp(() {
    mockNoteRepository = MockNoteRepository();
    useCase = GetAllNotesUsecase(noteRepository: mockNoteRepository);
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

  test('should get all notes from the repository', () async {
    when(mockNoteRepository.getAllNotes())
        .thenAnswer((_) async => Right(mockNotes));

    final result = await useCase(NoParams());

    expect(result, Right(mockNotes));
    expect(result, isA<Right<Failures, List<NoteEntity>>>());
    result.fold(
      (failure) => fail("Expected a success, but got a failure"),
      (notesList) {
        expect(notesList.length, 3);
        expect(notesList, mockNotes);
      },
    );

    verify(mockNoteRepository.getAllNotes());
    verifyNoMoreInteractions(mockNoteRepository);
  });

  test('should return a failure when repository call fails', () async {
    when(mockNoteRepository.getAllNotes())
        .thenAnswer((_) async => Left(CacheFailure(message: 'There are no notes.')));

    final result = await useCase(NoParams());

    expect(result, Left(CacheFailure(message: 'There are no notes.')));
    expect(result, isA<Left<Failures, List<NoteEntity>>>());
    result.fold(
      (failure) {
        expect(failure, isA<CacheFailure>());
        expect(failure.message, 'There are no notes.');
      },
      (_) => fail('Expected failure, but got success'),
    );

    verify(mockNoteRepository.getAllNotes());
    verifyNoMoreInteractions(mockNoteRepository);
  });
}