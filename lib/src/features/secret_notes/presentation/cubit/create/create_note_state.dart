import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_notes/src/core/error/failures.dart';
part 'create_note_state.freezed.dart';

/// Uses Freezed union types to model all possible states:
/// - [initialNotes]: before any action has been taken
/// - [loadingNotes]: when a note creation is in progress
/// - [errorOnCreateNotes]: when note creation fails
/// - [successOnCreateNotes]: when note creation succeeds
@freezed
sealed class CreateNoteState with _$CreateNoteState {
  /// Initial state before any note creation attempt.
  const factory CreateNoteState.initialNotes() = _InitialNotes;

  /// State when note creation is in progress.
  const factory CreateNoteState.loadingNotes() = _LoadingNotes;

  /// State when note creation fails.
  ///
  /// [savingNoteFailure] contains the specific failure reason.
  const factory CreateNoteState.errorOnCreateNotes({
    required Failures savingNoteFailure,
  }) = _ErrorOnCreateNotes;

  /// State when note creation succeeds.
  ///
  /// [isSuccess] indicates if the creation was successful.
  const factory CreateNoteState.successOnCreateNotes({
    required bool isSuccess,
  }) = _SuccessOnCreateNotes;

  /// Private constructor to allow adding custom getters.
  const CreateNoteState._();

  /// Returns `true` if the current state represents a loading state.
  bool get isLoading =>
      maybeWhen(loadingNotes: () => true, orElse: () => false);

  /// Returns `true` if the current state represents a failure state.
  bool get hasFailure =>
      maybeWhen(errorOnCreateNotes: (_) => true, orElse: () => false);

  /// Returns `true` if the current state represents a success state.
  bool get isSuccess =>
      maybeWhen(successOnCreateNotes: (_) => true, orElse: () => false);
}