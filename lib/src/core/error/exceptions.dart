class ServerError implements Exception {
  final String message;
  ServerError(this.message);
}

class CacheError implements Exception {
  final String message;
  CacheError(this.message);
}

class ResourceNotFoundError implements Exception {
  final String message;
  ResourceNotFoundError(this.message);
}