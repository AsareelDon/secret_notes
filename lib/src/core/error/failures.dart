import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

/// A [Failures] represents an error that can be safely
/// exposed to higher layers (presentation/UI).
///
/// Failures are immutable, comparable, and contain
/// a user-friendly [message].
@freezed
sealed class Failures with _$Failures {
  /// Failure representing cache-related issues.
  ///
  /// Typically mapped from a [CacheErrorException].
  const factory Failures.cache({
    required String message,
  }) = CacheFailure;

  /// Failure representing missing or unavailable resources.
  ///
  /// Common scenarios include:
  /// - No data found for a requested ID
  /// - Empty query result
  ///
  /// Usually mapped from a [ResourceNotFoundErrorException].
  const factory Failures.resourceNotFound({
    required String message,
  }) = ResourceNotFoundFailure;

  /// Failure representing an error while saving a note.
  ///
  /// Useful for distinguishing save/write errors
  /// from generic cache failures.
  const factory Failures.savingNote({
    required String message,
  }) = SavingNoteFailure;

  /// Failure representing an error while deleting a note.
  const factory Failures.noteDeletion({
    required String message,
  }) = NoteDeletionFailure;
}