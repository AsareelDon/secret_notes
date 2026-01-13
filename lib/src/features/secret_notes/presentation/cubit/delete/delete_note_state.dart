import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_notes/src/core/error/failures.dart';
part 'delete_note_state.freezed.dart';

/// This state is emitted by [DeleteNoteCubit] and consumed by the UI
/// to handle loading indicators, success feedback, and error handling.
///
/// Implemented using Freezed to ensure:
/// - Immutability
/// - Exhaustive state handling
/// - Value-based equality
@freezed
sealed class DeleteNoteState with _$DeleteNoteState {
  /// Initial state before any delete action is triggered.
  ///
  /// Typically emitted when the Cubit is first created or reset.
  const factory DeleteNoteState.initialDelete() = _InitialDelete;

  /// Indicates that a note deletion is currently in progress.
  ///
  /// The UI should display a loading indicator or disable actions
  /// while this state is active.
  const factory DeleteNoteState.loadingDeletion() = _LoadingDeletion;

  /// Indicates that the note was successfully deleted.
  ///
  /// This state is commonly used to trigger side effects such as:
  /// - Refreshing the notes list
  /// - Showing a success message
  /// - Navigating back
  const factory DeleteNoteState.successOnDeleteNotes({
    required bool isSuccess
  }) =_SuccessOnDeleteNotes;

  /// Indicates that an error occurred while deleting the note.
  ///
  /// Contains a domain-level [Failures] object that can be safely
  /// exposed to the UI layer.
  const factory DeleteNoteState.errorOnDeleteNotes({
    required Failures deleteFailure
  }) = _ErrorOnDeleteNotes;

  /// Private constructor required by Freezed.
  ///
  /// Allows adding shared getters and helper methods across
  /// all delete note states.
  const DeleteNoteState._();

  /// Returns `true` if the current state represents a loading state.
  bool get isLoading =>
      maybeWhen(loadingDeletion: () => true, orElse: () => false);

  /// Returns `true` if the current state represents a failure state.
  bool get hasFailure =>
      maybeWhen(errorOnDeleteNotes: (_) => true, orElse: () => false);

  /// Returns `true` if the current state represents a success state.
  bool get isSuccess =>
      maybeWhen(successOnDeleteNotes: (_) => true, orElse: () => false);
}