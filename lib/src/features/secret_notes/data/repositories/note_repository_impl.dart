import 'package:dartz/dartz.dart';
import 'package:secret_notes/src/core/error/exceptions.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

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
        creationDate: note.creationDate
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
}