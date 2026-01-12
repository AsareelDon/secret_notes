import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

@LazySingleton(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository{
  final NotesLocalDataSource notesLocalDataSource;

  NoteRepositoryImpl({required this.notesLocalDataSource});
  final devLogger = DevLogger.singleton;

  @override
  Future<Either<Failures, NoteEntity>> createNote(NoteEntity note) async {
    try {
      final createdNotes = NoteModel(
        noteTitle: note.noteTitle,
        noteContent: note.noteContent,
        creationDate: note.creationDate,
        lastEditDate: note.lastEditDate
      );
      await notesLocalDataSource.saveCreatedNote(createdNotes);
      devLogger.info("Note was saved!: $createdNotes");

      return Right(note);

    } on CacheErrorException catch (e) {
      devLogger.error("Error on saving note: ${e.message}");
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      devLogger.error("Error saving note: $e}");
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<NoteEntity>>> getAllNotes() async {
    try {
      final notes = await notesLocalDataSource.getSavedNotes();

      final List<NoteEntity> notesList = notes.map((note) => NoteEntity(
        noteId: note.noteId,
        noteTitle: note.noteTitle,
        noteContent: note.noteContent,
        creationDate: note.creationDate,
        lastEditDate: note.lastEditDate
      )).toList();

      devLogger.info("All notes were fetched! Count: ${notesList.length}");
      return Right(notesList);
    } on CacheErrorException catch (e) {
      devLogger.error("Error on fetching notes: ${e.message}");
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      devLogger.error("Error fetching notes: $e");
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, NoteEntity>> editNoteById(NoteEntity note) async {
    try {
      final createdNotes = NoteModel(
          noteId: note.noteId!,
          noteTitle: note.noteTitle,
          noteContent: note.noteContent,
          creationDate: note.creationDate,
          lastEditDate: note.lastEditDate
      );
      await notesLocalDataSource.saveEditedNote(createdNotes);
      devLogger.info("Note was saved!: $createdNotes");

      return Right(note);

    } on CacheErrorException catch (e) {
      devLogger.error("Error on saving note: ${e.message}");
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      devLogger.error("Error saving note: $e}");
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, int>> deleteNoteById(int noteId) async {
    try {
      await notesLocalDataSource.deleteNoteById(noteId);
      devLogger.info("Note was deleted! ID: $noteId");

      return Right(noteId);
    } on CacheErrorException catch (e) {
      devLogger.error("Error on deleting note: ${e.message}");
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      devLogger.error("Error deleting note: $e");
      return Left(CacheFailure(message: e.toString()));
    }
  }
}