import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';

abstract class NotesLocalDataSource {
  Future<void> saveCreatedNote(NoteModel note);
  Future<List<NoteModel>> getSavedNotes();
  Future<void> saveEditedNote(NoteModel note);
  Future<void> deleteNoteById(int noteId);
}