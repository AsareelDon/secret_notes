import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

class DeleteNoteByIdUseCase extends GenericUseCase<int, DeleteNoteParams> {
  final NoteRepository noteRepository;

  DeleteNoteByIdUseCase({required this.noteRepository});

  @override
  Future<Either<Failures, int>> call(DeleteNoteParams params) async {
    return await noteRepository.deleteNoteById(params.noteId);
  }
}

class DeleteNoteParams extends Equatable {
  final int noteId;

  const DeleteNoteParams({required this.noteId});

  @override
  List<Object?> get props => [noteId];
}