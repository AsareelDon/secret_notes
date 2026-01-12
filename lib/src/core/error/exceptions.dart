/// Exception thrown when a cache-related operation fails.
///
/// This exception represents low-level data source errors such as:
/// - Failure to read from local storage
/// - Failure to write or delete cached data
/// - Unexpected cache state
///
/// It should only be thrown inside the data layer and
/// later mapped to a corresponding [CacheFailure] in the domain layer.
class CacheErrorException implements Exception {
  /// Human-readable description of the cache error.
  final String message;

  /// Creates a [CacheErrorException] with the given [message].
  CacheErrorException(this.message);
}

/// Exception thrown when a requested resource cannot be found.
///
/// Common use cases include:
/// - Attempting to fetch a non-existent entity
/// - Querying an empty data source
///
/// This exception should be handled in the repository layer
/// and converted into a [ResourceNotFoundFailure].
class ResourceNotFoundErrorException implements Exception {
  /// Human-readable description of the error.
  final String message;

  /// Creates a [ResourceNotFoundErrorException] with the given [message].
  ResourceNotFoundErrorException(this.message);
}