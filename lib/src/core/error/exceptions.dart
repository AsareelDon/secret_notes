class ServerErrorException implements Exception {
  final String message;
  ServerErrorException(this.message);
}

class CacheErrorException implements Exception {
  final String message;
  CacheErrorException(this.message);
}

class ResourceNotFoundErrorException implements Exception {
  final String message;
  ResourceNotFoundErrorException(this.message);
}