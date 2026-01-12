import 'package:equatable/equatable.dart';

class DeleteNoteState extends Equatable {
  const DeleteNoteState();

  @override
  List<Object> get props => [];
}

class DeleteNoteInitial extends DeleteNoteState {
  const DeleteNoteInitial();

  @override
  List<Object> get props => [];
}

class DeleteNoteLoading extends DeleteNoteState {
  const DeleteNoteLoading();

  @override
  List<Object> get props => [];
}

class DeleteNoteSuccess extends DeleteNoteState {
  const DeleteNoteSuccess();

  @override
  List<Object> get props => [];
}

class DeleteNoteFailure extends DeleteNoteState {
  final String error;

  const DeleteNoteFailure({required this.error});

  @override
  List<Object> get props => [error];
}