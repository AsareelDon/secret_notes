import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

@LazySingleton()
class CreateNoteUseCase extends GenericUseCase<NoteEntity, NoteParams> {
  final NoteRepository noteRepository;

  CreateNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failures, NoteEntity>> call(NoteParams params) {
    return noteRepository.createNote(params.noteEntity);
  }
}

class NoteParams extends Equatable {
  const NoteParams({required this.noteEntity});

  final NoteEntity noteEntity;

  @override
  List<Object?> get props => [noteEntity];
}