import 'package:bloc/bloc.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/delete_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  late final DeleteNoteByIdUseCase deleteNoteByIdUseCase;

  DeleteNoteCubit({required this.deleteNoteByIdUseCase}) : super(DeleteNoteInitial());

  Future<void> deleteNoteById(int noteId) async {
    emit(DeleteNoteLoading());
    final result = await deleteNoteByIdUseCase.call(DeleteNoteParams(noteId: noteId));

    result.fold(
      (failure) => emit(DeleteNoteFailure(error: failure.message)),
      (data) {
        final noteResponse = NoteResponse(
          isSuccess: true,
          message: 'Note removed successfully',
        );
        emit(DeleteNoteSuccess(noteResponse: noteResponse));
      }
    );
  }
}