import 'package:equatable/equatable.dart';

/// Base class for all failures used in the domain layer.
///
/// A [Failures] instance represents an error that can be safely
/// exposed to higher layers (presentation/UI).
///
/// Failures are immutable, equatable, and contain a user-friendly
/// error [message].
abstract class Failures extends Equatable {
  /// Description of the failure.
  final String message;

  /// Creates a [Failures] instance with the provided [message].
  const Failures({required this.message});

  @override
  List<Object> get props => [message];
}

/// Failure representing cache-related issues.
///
/// This failure is typically created when a [CacheErrorException]
/// is caught in the repository layer.
class CacheFailure extends Failures {
  /// Creates a [CacheFailure] with the given [message].
  const CacheFailure({required super.message});
}

/// Failure representing missing or unavailable resources.
///
/// Common scenarios include:
/// - No data found for a requested ID
/// - Empty query result
///
/// Usually mapped from a [ResourceNotFoundErrorException].
class ResourceNotFoundFailure extends Failures {
  /// Creates a [ResourceNotFoundFailure] with the given [message].
  const ResourceNotFoundFailure({required super.message});
}

/// Failure representing an error while saving a note.
///
/// This failure is useful for distinguishing save/write errors
/// from generic cache failures.
class SavingNoteFailure extends Failures {
  /// Creates a [SavingNoteFailure] with the given [message].
  const SavingNoteFailure({required super.message});
}

class NoteDeletionFailure extends Failures {
  /// Creates a [NoteDeletionFailure] with the given [message].
  const NoteDeletionFailure({required super.message});
}