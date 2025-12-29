import 'package:dartz/dartz.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

class GetAllNotesUsecase extends GenericUseCase<NoteEntity?, NoParams>{
  final NoteRepository noteRepository;

  GetAllNotesUsecase({required this.noteRepository});

  @override
  Future<Either<Failures, NoteEntity?>> call(NoParams params) async {
    return await noteRepository.getAllNotes();
  }
}