import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/core/error/failures.dart';

abstract class EditNoteState extends Equatable {
  const EditNoteState();

  @override
  List<Object> get props => [];
}

class EditNoteInitial extends EditNoteState {
  const EditNoteInitial();

  @override
  List<Object> get props => [];
}
class EditNoteLoading extends EditNoteState {
  const EditNoteLoading();

  @override
  List<Object> get props => [];
}

class EditNoteLoaded extends EditNoteState {
  const EditNoteLoaded();

  @override
  List<Object> get props => [];
}

class EditNoteError extends EditNoteState {
  final SavingNoteFailure savingNoteFailure;

  const EditNoteError({required this.savingNoteFailure});

  @override
  List<Object> get props => [savingNoteFailure];
}