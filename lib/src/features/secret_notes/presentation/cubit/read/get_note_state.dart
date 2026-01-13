import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:secret_notes/src/core/error/failures.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
part 'get_note_state.freezed.dart';

/// This state is used by [GetNoteCubit] and consumed by the UI layer
/// to react to loading, success, and failure scenarios.
///
/// Implemented as a Freezed union to ensure:
/// - Exhaustive state handling
/// - Immutability
/// - Value-based equality
@freezed
sealed class GetNoteState with _$GetNoteState {
  /// Initial state before any action is performed.
  ///
  /// Typically emitted when the Cubit is first created.
  const factory GetNoteState.initialNotes() = _GetInitialNotes;

  /// Indicates that notes are currently being fetched.
  ///
  /// The UI should show a loading indicator when this state is active.
  const factory GetNoteState.loadingNotes() = _LoadingNotes;

  /// Indicates that notes were successfully fetched.
  ///
  /// Contains the list of retrieved [NoteEntity] objects.
  const factory GetNoteState.successOnFetchNotes({
    required List<NoteEntity> notes,
  }) = _SuccessOnFetchNotes;

  /// Indicates that an error occurred while fetching notes.
  ///
  /// Contains a domain-level [Failures] object that can be safely
  /// exposed to the UI layer.
  const factory GetNoteState.errorOnFetchNotes({
    required Failures cacheFailure,
  }) = _ErrorOnFetchNotes;

  /// Private constructor required by Freezed.
  ///
  /// Allows adding shared logic (getters/methods) across all states.
  const GetNoteState._();

  /// Returns `true` if the current state is [loadingNotes].
  ///
  /// Simplifying UI conditions:
  /// ```dart
  /// if (state.isLoading) ...
  /// ```
  bool get isLoading =>
      maybeWhen(loadingNotes: () => true, orElse: () => false);

  /// Returns `true` if the current state represents a failure.
  ///
  /// Allows the UI to react generically to error states
  /// without type-checking.
  bool get hasFailure =>
      maybeWhen(errorOnFetchNotes: (_) => true, orElse: () => false);

  /// Returns `List<NoteEntity>` if notes were fetched successfully.
  ///
  /// Used to list in home page
  List<NoteEntity> get isSuccess =>
      maybeWhen(successOnFetchNotes: (notes) => notes, orElse: () => []);
}