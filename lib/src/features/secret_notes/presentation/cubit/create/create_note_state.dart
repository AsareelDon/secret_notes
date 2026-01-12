import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/core/error/failures.dart';

abstract class CreateNoteState extends Equatable {
  const CreateNoteState();

  @override
  List<Object> get props => [];
}

class CreateNoteInitial extends CreateNoteState {
  const CreateNoteInitial();

  @override
  List<Object> get props => [];
}
class CreateNoteLoading extends CreateNoteState {
  const CreateNoteLoading();

  @override
  List<Object> get props => [];
}

class CreateNoteSuccess extends CreateNoteState {
  const CreateNoteSuccess();

  @override
  List<Object> get props => [];
}

class CreateNoteFailure extends CreateNoteState {
  final SavingNoteFailure savingNoteFailure;

  const CreateNoteFailure({required this.savingNoteFailure});

  @override
  List<Object> get props => [savingNoteFailure];
}