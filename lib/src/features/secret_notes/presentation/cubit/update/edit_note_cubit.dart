import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_state.dart';

@injectable
class EditNoteCubit extends Cubit<EditNoteState> {
  final EditNoteByIdUseCase editNoteByIdUseCase;

  EditNoteCubit({required this.editNoteByIdUseCase}) : super(EditNoteInitial());

  Future<void> editNoteById(NoteEntity noteEntity) async {
    emit(EditNoteLoading());
    final result = await editNoteByIdUseCase.call(EditNoteParams(noteEntity: noteEntity));

    result.fold(
      (failure) => emit(EditNoteError(savingNoteFailure:SavingNoteFailure(message: failure.message) )),
      (success) => emit(EditNoteLoaded()),
    );
  }
}