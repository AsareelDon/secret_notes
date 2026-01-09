import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/DTOs/response/note_response.dart';

class DeleteNoteState extends Equatable {
  const DeleteNoteState();

  @override
  List<Object> get props => [];
}

class DeleteNoteInitial extends DeleteNoteState {}

class DeleteNoteLoading extends DeleteNoteState {}

class DeleteNoteSuccess extends DeleteNoteState {
  final NoteResponse noteResponse;

  const DeleteNoteSuccess({required this.noteResponse});

  @override
  List<Object> get props => [noteResponse];
}

class DeleteNoteFailure extends DeleteNoteState {
  final String error;

  const DeleteNoteFailure({required this.error});

  @override
  List<Object> get props => [error];
}