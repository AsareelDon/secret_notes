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
}