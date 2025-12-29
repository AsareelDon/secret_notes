import 'package:bloc/bloc.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/create_note_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';

class CreateNoteCubit extends Cubit<CreateNoteState> {
  late final CreateNoteUseCase createNoteUseCase;

  CreateNoteCubit({required this.createNoteUseCase}) : super(CreateNoteInitial());

  Future<void> createNote(NoteEntity noteEntity) async {
    emit(CreateNoteLoading());
    final result = await createNoteUseCase.call(NoteParams(noteEntity: noteEntity));

    result.fold(
      (failure) => emit(CreateNoteFailure(error: failure.message)),
      (success) {
        final noteResponse = NoteResponse(
            isSuccess: true,
            message: "Note created successfully",
            noteData: noteEntity
        );
        emit(CreateNoteSuccess(noteResponse: noteResponse));
      }
    );
  }
}