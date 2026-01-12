import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/create_note_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';

@injectable
class CreateNoteCubit extends Cubit<CreateNoteState> {
  final CreateNoteUseCase createNoteUseCase;

  CreateNoteCubit({required this.createNoteUseCase}) : super(CreateNoteInitial());

  Future<void> createNote(NoteEntity noteEntity) async {
    emit(CreateNoteLoading());
    final result = await createNoteUseCase.call(NoteParams(noteEntity: noteEntity));

    result.fold(
      (failure) => emit(CreateNoteFailure(savingNoteFailure: SavingNoteFailure(message: failure.message))),
      (success) => emit(CreateNoteSuccess()),
    );
  }
}