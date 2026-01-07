import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';

abstract class GetNoteState extends Equatable {
  const GetNoteState();

  @override
  List<Object> get props => [];
}

class GetNoteInitial extends GetNoteState {}
class GetNoteLoading extends GetNoteState {}

class GetNoteLoaded extends GetNoteState {
  final List<NoteEntity> notes;

  const GetNoteLoaded({required this.notes});

  @override
  List<Object> get props => [notes];
}

class GetNoteError extends GetNoteState {
  final String message;

  const GetNoteError({required this.message});

  @override
  List<Object> get props => [message];
}