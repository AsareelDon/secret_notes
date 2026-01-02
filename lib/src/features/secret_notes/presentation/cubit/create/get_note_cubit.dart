import 'package:bloc/bloc.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  late final GetAllNotesUsecase getAllNotesUsecase;

  GetNoteCubit({required this.getAllNotesUsecase}) : super(GetNoteInitial());

  Future<void> getAllNotes() async {
    emit(GetNoteLoading());
    final result = await getAllNotesUsecase(NoParams());

    result.fold(
      (failure) => emit(GetNoteError(message: failure.message)),
      (noteLists) => emit(GetNoteLoaded(notes: noteLists))
    );
  }
}