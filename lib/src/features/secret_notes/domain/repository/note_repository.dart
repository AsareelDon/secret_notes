import 'package:dartz/dartz.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Failures, NoteEntity>> createNote(NoteEntity note);
  Future<Either<Failures, NoteEntity>> getAllNotes();
}