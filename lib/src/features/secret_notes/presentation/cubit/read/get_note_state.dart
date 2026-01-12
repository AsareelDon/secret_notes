import 'package:equatable/equatable.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';

abstract class GetNoteState extends Equatable {
  const GetNoteState();

  @override
  List<Object> get props => [];
}

class GetNoteInitial extends GetNoteState {
  const GetNoteInitial();

  @override
  List<Object> get props => [];
}
class GetNoteLoading extends GetNoteState {
  const GetNoteLoading();

  @override
  List<Object> get props => [];
}

class GetNoteLoaded extends GetNoteState {
  final List<NoteEntity> notes;

  const GetNoteLoaded({required this.notes});

  @override
  List<Object> get props => [notes];
}

class GetNoteError extends GetNoteState {
  final CacheFailure cacheFailure;

  const GetNoteError({required this.cacheFailure});

  @override
  List<Object> get props => [cacheFailure];
}