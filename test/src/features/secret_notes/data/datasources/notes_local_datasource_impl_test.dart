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
      noteModelBox: mockBox,
    );
  });

  final mockNoteObject = NoteModel(noteId: 1, noteTitle: 'Create a mock note', noteContent: 'mockNote content', creationDate: DateTime.now());

  test("GIVEN a new note, WHEN [saveCreatedNote] is called, THEN it should call put on the modelBox", () async {
    when(mockBox.put(mockNoteObject)).thenReturn(1);
    await dataSourceImpl.saveCreatedNote(mockNoteObject);
    verify(mockBox.put(mockNoteObject)).called(1);
  });
  
  test("GIVEN [saveCreatedNote] fails on modelBox.put, WHEN [saveCreatedNote] is called, THEN it should throw CacheErrorException", () async {
    when(mockBox.put(mockNoteObject))
        .thenThrow(CacheErrorException('Failed to save notes'));

    expect(() => dataSourceImpl.saveCreatedNote(mockNoteObject), throwsA(isA<CacheErrorException>()));
    verify(mockBox.put(mockNoteObject)).called(1);
  });

  test("GIVEN existing notes in the box, WHEN [getSavedNotes] is called, THEN it should return a list of NoteModel", () async {
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

  test("GIVEN query.find throws an exception, WHEN [getSavedNotes] is called, THEN it should throw [CacheErrorException]", () async {
    when(mockBox.query()).thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.order(any, flags: anyNamed('flags')))
        .thenReturn(mockQueryBuilder);
    when(mockQueryBuilder.build()).thenReturn(mockQuery);
    when(mockQuery.find()).thenThrow(CacheErrorException('Failed to fetch notes'));

    expect(() => dataSourceImpl.getSavedNotes(), throwsA(isA<CacheErrorException>()));
    verify(mockQuery.find()).called(1);
  });

  test("GIVEN a note exists, WHEN [saveEditedNote] is called, THEN it should update the note in the box", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(mockNoteObject);
    when(mockBox.put(mockNoteObject)).thenReturn(1);
    await dataSourceImpl.saveEditedNote(mockNoteObject);
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
    verify(mockBox.put(mockNoteObject)).called(1);
  });

  test("GIVEN a note does not exist, WHEN [saveEditedNote] is called, THEN it should throw [ResourceNotFoundErrorException]", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(null);

    await expectLater(() => dataSourceImpl.saveEditedNote(mockNoteObject), throwsA(isA<ResourceNotFoundErrorException>()),);
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });

  test("GIVEN [modelBox.get] throws an exception, WHEN [saveEditedNote] is called, THEN it should throw [CacheErrorException]", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenThrow(CacheErrorException('Failed to get note'));

    expect(() => dataSourceImpl.saveEditedNote(mockNoteObject), throwsA(isA<CacheErrorException>()));
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });

  test("GIVEN a note exists, WHEN [deleteNoteById] is called, THEN it should remove the note from the box", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(mockNoteObject);
    when(mockBox.remove(mockNoteObject.noteId))
        .thenReturn(true);
    await dataSourceImpl.deleteNoteById(mockNoteObject.noteId);
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
    verify(mockBox.remove(mockNoteObject.noteId)).called(1);
  });

  test("GIVEN a note does not exist, WHEN [deleteNoteById] is called, THEN it should throw [ResourceNotFoundErrorException]", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenReturn(null);

    expect(() => dataSourceImpl.deleteNoteById(mockNoteObject.noteId), throwsA(isA<ResourceNotFoundErrorException>()));
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });

  test("GIVEN [modelBox.get] throws an exception, WHEN [deleteNoteById] is called, THEN it should throw [CacheErrorException]", () async {
    when(mockBox.get(mockNoteObject.noteId))
        .thenThrow(CacheErrorException('Failed to get note'));

    expect(() => dataSourceImpl.deleteNoteById(mockNoteObject.noteId), throwsA(isA<CacheErrorException>()));
    verify(mockBox.get(mockNoteObject.noteId)).called(1);
  });
}