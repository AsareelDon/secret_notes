import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

@LazySingleton()
class GetAllNotesUsecase extends GenericUseCase<List<NoteEntity>, NoParams>{
  final NoteRepository noteRepository;

  GetAllNotesUsecase({required this.noteRepository});

  @override
  Future<Either<Failures, List<NoteEntity>>> call(NoParams params) => noteRepository.getAllNotes();
}