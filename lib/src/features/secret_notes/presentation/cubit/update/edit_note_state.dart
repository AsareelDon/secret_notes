import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_notes/src/core/error/failures.dart';
part 'edit_note_state.freezed.dart';

/// Uses Freezed union types to model all possible states:
/// - [initialNotes]: before any action has been taken
/// - [loadingNotes]: when a note creation is in progress
/// - [errorOnEditNotes]: when note creation fails
/// - [successOnEditNotes]: when note creation succeeds
@freezed
sealed class EditNoteState with _$EditNoteState {
  /// Initial state before any edit note attempt.
  const factory EditNoteState.initialNotes() = _InitialNotes;

  /// State when editing note is in progress.
  const factory EditNoteState.loadingNotes() = _LoadingNotes;

  /// State when editing note fails.
  ///
  /// [savingNoteFailure] contains the specific failure reason.
  const factory EditNoteState.errorOnEditNotes({
    required Failures savingNoteFailure,
  }) = _ErrorOnCreateNotes;

  /// State when editing note succeeds.
  ///
  /// [isSuccess] indicates if the creation was successful.
  const factory EditNoteState.successOnEditNotes({
    required bool isSuccess,
  }) = _SuccessOnCreateNotes;

  /// Private constructor to allow adding custom getters.
  const EditNoteState._();

  /// Returns `true` if the current state represents a loading state.
  bool get isLoading =>
      maybeWhen(loadingNotes: () => true, orElse: () => false);

  /// Returns `true` if the current state represents a failure state.
  bool get hasFailure =>
      maybeWhen(errorOnEditNotes: (_) => true, orElse: () => false);

  /// Returns `true` if the current state represents a success state.
  bool get isSuccess =>
      maybeWhen(successOnEditNotes: (_) => true, orElse: () => false);
}