import 'package:logger/logger.dart';

class AppLoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(),
    level: Level.debug,
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void trace(String message) {
    _logger.t(message);
  }

  static void error(String message, [dynamic error]) {
    _logger.e(message, error: error, stackTrace: StackTrace.current);
  }

  static void fatal(String message, [dynamic error]) {
    _logger.f(message, error: error, stackTrace: StackTrace.current);
  }
}
