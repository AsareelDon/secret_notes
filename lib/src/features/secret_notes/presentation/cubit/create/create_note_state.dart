import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';

abstract class CreateNoteState extends Equatable {
  const CreateNoteState();

  @override
  List<Object> get props => [];
}

class CreateNoteInitial extends CreateNoteState {}
class CreateNoteLoading extends CreateNoteState {}

class CreateNoteSuccess extends CreateNoteState {
  final NoteResponse noteResponse;
  const CreateNoteSuccess({required this.noteResponse});

  @override
  List<Object> get props => [noteResponse];
}

class CreateNoteFailure extends CreateNoteState {
  final String error;
  const CreateNoteFailure({required this.error});

  @override
  List<Object> get props => [error];
}