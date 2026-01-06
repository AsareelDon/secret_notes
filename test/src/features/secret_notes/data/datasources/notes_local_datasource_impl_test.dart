import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:objectbox/objectbox.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource_impl.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'notes_local_datasource_impl_test.mocks.dart';

@GenerateMocks([Store, Box])
void main() {
  late NotesLocalDataSourceImpl dataSourceImpl;
  late MockStore mockStore;
  late MockBox<NoteModel> mockBox;

  setUp(() {
    mockStore = MockStore();
    mockBox = MockBox();
    dataSourceImpl = NotesLocalDataSourceImpl(store: mockStore, box: mockBox);
  });

  final mockNoteObject = NoteModel(noteTitle: 'Create a mock note', noteContent: 'mockNote content', creationDate: DateTime.now());

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

  test("should call modelBox-getAll when getting all notes", () async {
    when(mockBox.getAll()).thenReturn([mockNoteObject]);
    await dataSourceImpl.getSavedNotes();
    verify(mockBox.getAll()).called(1);
  });

  test("should throw cache-error-exception when modelBox-getAll failed", () async {
    when(mockBox.getAll())
        .thenThrow(CacheErrorException('Failed to get notes'));

    expect(() => dataSourceImpl.getSavedNotes(), throwsA(isA<CacheErrorException>()));
    verify(mockBox.getAll()).called(1);
  });

  test("should return list of notes when modelBox-getAll is successful", () async {
    when(mockBox.getAll()).thenReturn([mockNoteObject]);
    final result = await dataSourceImpl.getSavedNotes();
    expect(result, [mockNoteObject]);
    verify(mockBox.getAll()).called(1);
  });
}