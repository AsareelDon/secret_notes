import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/repository/note_repository.dart';

@LazySingleton()
class EditNoteByIdUseCase extends GenericUseCase<NoteEntity, EditNoteParams> {
  final NoteRepository noteRepository;

  EditNoteByIdUseCase({required this.noteRepository});

  @override
  Future<Either<Failures, NoteEntity>> call(EditNoteParams params) async {
    return await noteRepository.editNoteById(params.noteEntity);
  }
}

class EditNoteParams extends Equatable {
  final NoteEntity noteEntity;

  const EditNoteParams({required this.noteEntity});

  @override
  List<Object?> get props => [noteEntity];
}