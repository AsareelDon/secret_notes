import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:objectbox/objectbox.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource_impl.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'notes_local_datasource_impl_test.mocks.dart';

@GenerateMocks(
  [Store, Box, Query<NoteModel>],
  customMocks: [
    MockSpec<QueryBuilder<NoteModel>>(
      unsupportedMembers: {#link, #backlink, #linkMany, #backlinkMany},
    ),
  ],
)
void main() {
  late NotesLocalDataSourceImpl dataSourceImpl;
  late MockStore mockStore;
  late MockBox<NoteModel> mockBox;
  late MockQueryBuilder mockQueryBuilder;
  late MockQuery<NoteModel> mockQuery;

  setUp(() {
    mockStore = MockStore();
    mockBox = MockBox();
    mockQueryBuilder = MockQueryBuilder();
    mockQuery = MockQuery<NoteModel>();

    dataSourceImpl = NotesLocalDataSourceImpl(
      store: mockStore,
      box: mockBox,
    );
  });

  final mockNoteObject = NoteModel(noteId: 1, noteTitle: 'Create a mock note', noteContent: 'mockNote content', creationDate: DateTime.now());

  test("should call modelBox-put when saving note", () async {
    when(mockBox.put(mockNoteObject)).thenReturn(1);
    await dataSourceImpl.saveCreatedNote(mockNoteObject);
    verify(mockBox.put(mockNoteObject)).called(1);
  });
  
  test("should throw cache-error-exception when modelBox-put failed", () async {
    when(mockBox.put(mockNoteObject))
        .thenThrow(CacheErrorException('Failed to save notes'));

    expect(() => dataSourceImpl.saveCreatedNote(mockNoteObject), throwsA(isA<CacheErrorException>()));
    verify(mockBox.put(mockNoteObject)).called(1);
  });

  test("should return list of note model when query finds notes", () async {
    when(mockBox.query()).thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.order(any, flags: anyNamed('flags')))
        .thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.build()).thenReturn(mockQuery);
    when(mockQuery.find()).thenReturn([mockNoteObject]);

    final result = await dataSourceImpl.getSavedNotes();
    expect(result, [mockNoteObject]);
    verify(mockBox.query()).called(1);
    verify(mockQueryBuilder.build()).called(1);
    verify(mockQuery.find()).called(1);
  });

  test("should throw cache-error-exception when find fails", () async {
    when(mockBox.query()).thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.order(any, flags: anyNamed('flags')))
        .thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.build()).thenReturn(mockQuery);
    when(mockQuery.find()).thenThrow(CacheErrorException('Failed to fetch notes'));

    expect(() => dataSourceImpl.getSavedNotes(), throwsA(isA<CacheErrorException>()));
    verify(mockQuery.find()).called(1);
  });

  test("should save edited note when note does exist by noteId", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(mockNoteObject);
    when(mockBox.put(mockNoteObject)).thenReturn(1);
    await dataSourceImpl.saveEditedNote(mockNoteObject);
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
    verify(mockBox.put(mockNoteObject)).called(1);
  });

  test("should throw cache-error-exception when noteId does not exist", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(null);

    expect(() => dataSourceImpl.saveEditedNote(mockNoteObject), throwsA(isA<CacheErrorException>()));
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });

  test("should throw cache-error-exception when modelBox-get failed", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenThrow(CacheErrorException('Failed to get note'));

    expect(() => dataSourceImpl.saveEditedNote(mockNoteObject), throwsA(isA<CacheErrorException>()));
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });
}