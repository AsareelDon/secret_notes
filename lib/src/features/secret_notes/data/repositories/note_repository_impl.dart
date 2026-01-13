import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

/// This repository handles all note-related operations in the domain layer,
/// including creating, fetching, editing, and deleting notes.
///
/// Errors from the data layer are caught and mapped to [Failures] using
/// `Either<Failures, T>` to safely expose results to the domain/presentation layers.
///
/// This class is registered as a **lazy singleton** via Injectable, ensuring
/// a single instance is shared across the app.
@LazySingleton(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository {
  /// Local data source responsible for direct database operations.
  final NotesLocalDataSource notesLocalDataSource;

  /// Logger instance for debugging and error tracking.
  final devLogger = DevLogger.singleton;

  /// Creates a [NoteRepositoryImpl] with the given [notesLocalDataSource].
  ///
  /// [notesLocalDataSource] is automatically provided by Injectable.
  NoteRepositoryImpl({required this.notesLocalDataSource});

  /// Creates a new note and saves it via [NotesLocalDataSource].
  ///
  /// Returns [Right<NoteEntity>] on success or [Left<CacheFailure>] on error.
  @override
  Future<Either<Failures, NoteEntity>> createNote(NoteEntity note) async {
    try {
      final createdNotes = NoteModel(
        noteTitle: note.noteTitle,
        noteContent: note.noteContent,
        creationDate: note.creationDate,
        lastEditDate: note.lastEditDate,
      );
      await notesLocalDataSource.saveCreatedNote(createdNotes);
      devLogger.info("Note was saved!: $createdNotes");

      return Right(note);

    } on CacheErrorException catch (e) {
      devLogger.error("Error on saving note: ${e.message}");
      return Left(Failures.savingNote(message: e.message));
    } catch (e) {
      devLogger.error("Error saving note: $e");
      return Left(Failures.cache(message: e.toString()));
    }
  }

  /// Retrieves all notes from the local data source.
  ///
  /// Converts [NoteModel] instances to [NoteEntity] for the domain layer.
  /// Returns [Right<List<NoteEntity>>] on success or [Left<CacheFailure>] on error.
  @override
  Future<Either<Failures, List<NoteEntity>>> getAllNotes() async {
    try {
      final notes = await notesLocalDataSource.getSavedNotes();

      final List<NoteEntity> notesList = notes.map((note) => NoteEntity(
        noteId: note.noteId,
        noteTitle: note.noteTitle,
        noteContent: note.noteContent,
        creationDate: note.creationDate,
        lastEditDate: note.lastEditDate,
      )).toList();

      devLogger.info("All notes were fetched! Count: ${notesList.length}");
      return Right(notesList);

    } on CacheErrorException catch (e) {
      devLogger.error("Error on fetching notes: ${e.message}");
      return Left(Failures.cache(message: e.message));
    } catch (e) {
      devLogger.error("Error fetching notes: $e");
      return Left(Failures.cache(message: e.toString()));
    }
  }

  /// Updates an existing note by its ID.
  ///
  /// Returns [Right<NoteEntity>] on success
  /// or
  ///   - [Left<SavingNoteFailure>]
  ///   - [Left<ResourceNotFoundFailure>]
  /// on error.
  @override
  Future<Either<Failures, NoteEntity>> editNoteById(NoteEntity note) async {
    try {
      final createdNotes = NoteModel(
        noteId: note.noteId!,
        noteTitle: note.noteTitle,
        noteContent: note.noteContent,
        creationDate: note.creationDate,
        lastEditDate: note.lastEditDate,
      );
      await notesLocalDataSource.saveEditedNote(createdNotes);
      devLogger.info("Note was saved!: $createdNotes");

      return Right(note);

    } on CacheErrorException catch (error) {
      devLogger.error("Error on saving note: ${error.message}");
      return Left(Failures.savingNote(message: error.message));
    } on ResourceNotFoundErrorException catch (error) {
      devLogger.error("Note not found: ${error.message}");
      return Left(Failures.resourceNotFound(message: error.message));
    } catch (error) {
      devLogger.error("Error saving note: $error");
      return Left(Failures.savingNote(message: error.toString()));
    }
  }

  /// Deletes a note by its ID.
  ///
  /// Returns [Right<int>] containing the deleted note ID on success,
  /// or
  ///   - [Left<NoteDeletionFailure>]
  ///   - [Left<ResourceNotFoundFailure>]
  /// on error.
  @override
  Future<Either<Failures, int>> deleteNoteById(int noteId) async {
    try {
      await notesLocalDataSource.deleteNoteById(noteId);
      devLogger.info("Note was deleted! ID: $noteId");

      return Right(noteId);

    } on CacheErrorException catch (error) {
      devLogger.error("Error on deleting note: ${error.message}");
      return Left(Failures.noteDeletion(message: error.message));
    } on ResourceNotFoundErrorException catch (error) {
      devLogger.error("Note not found: ${error.message}");
      return Left(Failures.resourceNotFound(message: error.message));
    } catch (error) {
      devLogger.error("Error deleting note: $error");
      return Left(Failures.noteDeletion(message: error.toString()));
    }
  }
}