import 'package:bloc/bloc.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  late final EditNoteByIdUseCase editNoteByIdUseCase;

  EditNoteCubit({required this.editNoteByIdUseCase}) : super(EditNoteInitial());

  Future<void> editNoteById(NoteEntity noteEntity) async {
    emit(EditNoteLoading());
    final result = await editNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity));

    result.fold(
      (failure) => emit(EditNoteError(error: failure.message)),
      (success) {
        final noteResponse = NoteResponse(
          isSuccess: true,
          message: 'Note updated successfully',
          noteData: noteEntity,
        );
        emit(EditNoteLoaded(noteResponse: noteResponse));
      }
    );
  }
}