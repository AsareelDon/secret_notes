import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/delete_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_state.dart';

@injectable
class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  final DeleteNoteByIdUseCase deleteNoteByIdUseCase;

  DeleteNoteCubit({required this.deleteNoteByIdUseCase}) : super(DeleteNoteState.initialDelete());

  Future<void> deleteNoteById(int noteId) async {
    emit(DeleteNoteState.loadingDeletion());
    final result = await deleteNoteByIdUseCase.call(DeleteNoteParams(noteId: noteId));

    result.fold(
      (failure) => emit(
          DeleteNoteState.errorOnDeleteNotes(
              deleteFailure: Failures.noteDeletion(message: failure.message)
          )
      ),
      (data) => emit(DeleteNoteState.successOnDeleteNotes(isSuccess: true))
    );
  }
}