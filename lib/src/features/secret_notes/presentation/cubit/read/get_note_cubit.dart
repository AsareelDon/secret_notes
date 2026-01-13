import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/core/usecase/generic_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/read/get_note_state.dart';

@injectable
class GetNoteCubit extends Cubit<GetNoteState> {
  final GetAllNotesUsecase getAllNotesUsecase;

  GetNoteCubit({required this.getAllNotesUsecase}) : super(GetNoteState.initialNotes());

  Future<void> getAllNotes() async {
    emit(GetNoteState.loadingNotes());
    final result = await getAllNotesUsecase(NoParams());

    result.fold(
      (failure) => emit(
          GetNoteState.errorOnFetchNotes(
              cacheFailure: Failures.cache(message: failure.message)
          )
      ),
      (noteLists) => emit(GetNoteState.successOnFetchNotes(notes: noteLists))
    );
  }
}