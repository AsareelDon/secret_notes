import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';

abstract class EditNoteState extends Equatable {
  const EditNoteState();

  @override
  List<Object> get props => [];
}

class EditNoteInitial extends EditNoteState {}
class EditNoteLoading extends EditNoteState {}

class EditNoteLoaded extends EditNoteState {
  final NoteResponse noteResponse;

  const EditNoteLoaded({required this.noteResponse});

  @override
  List<Object> get props => [noteResponse];
}

class EditNoteError extends EditNoteState {
  final String error;
  const EditNoteError({required this.error});

  @override
  List<Object> get props => [error];
}