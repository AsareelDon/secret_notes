import 'package:secret_notes/objectbox.g.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  final Store store;
  final Box<NoteModel> noteModelBox;
  final devLogger =  DevLogger.singleton;

  NotesLocalDataSourceImpl({required this.store, Box<NoteModel>? box})
      : noteModelBox = box ?? store.box<NoteModel>();

  @override
  Future<void> saveCreatedNote(NoteModel note) async {
    try {
      noteModelBox.put(note);
      devLogger.info('Note saved successfully!: ${note.noteTitle}');
    } catch (error, stackTrace) {
      devLogger.error('Error saving note: $error', error, stackTrace);
      throw CacheErrorException('Failed to save notes');
    }
  }

  @override
  Future<List<NoteModel>> getSavedNotes() async {
    try {
      final query = noteModelBox.query().order(
        NoteModel_.lastEditDate,
        flags: Order.descending,
      ).build();

      final List<NoteModel> notes = query.find();
      query.close();

      devLogger.info('Notes fetched successfully! Count=${notes.length}');
      return notes;
    } catch (error, stackTrace) {
      devLogger.error('Error fetching notes: $error', error, stackTrace);
      throw CacheErrorException('Failed to fetch notes');
    }
  }

  @override
  Future<void> saveEditedNote(NoteModel note) async {
    try {
      final NoteModel? existingNote = noteModelBox.get(note.noteId);

      if (existingNote != null) {
        noteModelBox.put(note);
        devLogger.info('Note updated successfully!: ${note.noteTitle}');
      } else {
        throw CacheErrorException('Note not found');
      }
    } catch (error, stackTrace) {
      devLogger.error('Error editing note: $error', error, stackTrace);
      throw CacheErrorException('Failed to edit notes');
    }
  }

  @override
  Future<void> deleteNoteById(int noteId) async {
    try {
      final NoteModel? note = noteModelBox.get(noteId);

      if (note != null) {
        noteModelBox.remove(noteId);
        devLogger.info('Note deleted successfully!: ${note.noteTitle}');
      } else {
        throw CacheErrorException('Note not found');
      }
    } catch (error, stackTrace) {
      devLogger.error('Error deleting note: $error', error, stackTrace);
      throw CacheErrorException('Failed to delete notes');
    }
  }
}