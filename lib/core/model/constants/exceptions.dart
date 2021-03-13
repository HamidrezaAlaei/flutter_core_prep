class CacheException implements Exception {
  String message;

  CacheException({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
