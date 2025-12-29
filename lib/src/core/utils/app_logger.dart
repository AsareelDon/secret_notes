import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart';

class DevLogger {
  late final Logger log;

  DevLogger._internal() {
    log = Logger('DevLogger');
    hierarchicalLoggingEnabled = true;
    log.level = Level.ALL;
  }

  static final DevLogger singleton = DevLogger._internal();

  void info(String message) {
    if (kDebugMode) {
      log.info(message);
    }
  }

  void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      log.severe(message);
    }
  }

  void warning(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      log.warning(message);
    }
  }

  void debug(String message) {
    if (kDebugMode) {
      log.fine(message);
    }
  }
}