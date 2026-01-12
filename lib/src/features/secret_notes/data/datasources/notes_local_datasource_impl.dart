import 'package:injectable/injectable.dart';
import 'package:secret_notes/objectbox.g.dart' as ob;
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';

/// This class handles all local data operations for notes, including:
/// - Creating notes
/// - Reading saved notes
/// - Updating existing notes
/// - Deleting notes by ID
///
/// All operations are logged using [DevLogger] and exceptions are
/// converted into domain-appropriate [CacheErrorException] or
/// [ResourceNotFoundErrorException].
///
/// This class is registered as a **lazy singleton** via Injectable,
/// meaning a single instance will be shared across the app and
/// instantiated only when first requested.
@LazySingleton(as: NotesLocalDataSource)
class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  /// ObjectBox store used to access boxes and manage database transactions.
  final ob.Store store;

  /// ObjectBox box specifically for [NoteModel] entities.
  final ob.Box<NoteModel> noteModelBox;

  /// Logger instance for debugging and error tracking.
  final devLogger = DevLogger.singleton;

  /// Creates a [NotesLocalDataSourceImpl] with the given [store] and [noteModelBox].
  ///
  /// Both [store] and [noteModelBox] are automatically provided by Injectable.
  NotesLocalDataSourceImpl({
    required this.store,
    required this.noteModelBox,
  });

  /// Saves a newly created note to the local database.
  ///
  /// Throws [CacheErrorException] if saving fails.
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

  /// Retrieves all saved notes, ordered by [lastEditDate] date descending.
  ///
  /// Throws [CacheErrorException] if fetching fails.
  @override
  Future<List<NoteModel>> getSavedNotes() async {
    try {
      final query = noteModelBox.query()
          .order(ob.NoteModel_.lastEditDate, flags: ob.Order.descending)
          .build();

      final List<NoteModel> notes = query.find();
      query.close();

      devLogger.info('Notes fetched successfully! Count=${notes.length}');
      return notes;

    } catch (error, stackTrace) {
      devLogger.error('Error fetching notes: $error', error, stackTrace);
      throw CacheErrorException('Failed to fetch notes');
    }
  }

  /// Updates an existing note in the local database.
  ///
  /// Throws [ResourceNotFoundErrorException] if the note does not exist.
  /// Throws [CacheErrorException] if the update fails.
  @override
  Future<void> saveEditedNote(NoteModel note) async {
    try {
      final NoteModel? existingNote = noteModelBox.get(note.noteId);
      if (existingNote == null) {
        devLogger.error('Note not found: ID=${note.noteId}');
        throw ResourceNotFoundErrorException('Note not found');
      }

      noteModelBox.put(note);
      devLogger.info('Note updated successfully!: ${note.noteTitle}');

    } on ResourceNotFoundErrorException catch (error) {
      throw ResourceNotFoundErrorException(error.message);
    } catch (error, stackTrace) {
      devLogger.error('Error editing note: $error', error, stackTrace);
      throw CacheErrorException('Failed to edit notes');
    }
  }

  /// Deletes a note by its ID.
  ///
  /// Throws [ResourceNotFoundErrorException] if the note does not exist.
  /// Throws [CacheErrorException] if the deletion fails.
  @override
  Future<void> deleteNoteById(int noteId) async {
    try {
      final NoteModel? existingNote = noteModelBox.get(noteId);
      if (existingNote == null) {
        devLogger.error('Note not found: ID=$noteId');
        throw ResourceNotFoundErrorException('Note not found');
      }

      noteModelBox.remove(noteId);
      devLogger.info('Note deleted successfully!: ${existingNote.noteTitle}');

    } on ResourceNotFoundErrorException catch (error) {
      throw ResourceNotFoundErrorException(error.message);
    } catch (error, stackTrace) {
      devLogger.error('Error deleting note: $error', error, stackTrace);
      throw CacheErrorException('Failed to delete notes');
    }
  }
}