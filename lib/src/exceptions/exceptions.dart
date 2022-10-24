import 'exception_message.dart';

/// [AppException] is the abstract class upon which all other
/// exceptions are derived. AppExceptions are serious errors
/// for which little can be done to mitigate. Callers should
/// handle exceptions in a safe manner to prevent further
/// catastrophe.
///
/// Each  [AppException] has a default [ExceptionMessage] and an optional
/// [AdditionalInfo] should the developer feels it necessary
/// to provide further information.
abstract class AppException implements Exception {
  AppException(ExceptionMessage message) {
    _message = message.value;
  }

  late String _message;

  String get message => _message;

  @override
  String toString() => _message;
}

// Define specific exceptions below. And keep the classes sorted by name.

/// [NotFoundException]
class NotFoundException extends AppException {
  NotFoundException(ExceptionMessage message)
      : super(ExceptionMessage('Invalid value. ${message.value}'));
}

/// [NumberValueException]
class NumberValueException extends AppException {
  NumberValueException(ExceptionMessage message)
      : super(ExceptionMessage('Invalid value. ${message.value}'));
}

/// [PasswordFormatException] is thrown when a Password is improperly formatted,
/// i.e. it has one upper case letter, one lower case letter, one number and one
/// special character of !$>_}.<"|+):/*+&^..
class PasswordFormatException extends ValueException {
  PasswordFormatException(ExceptionMessage message)
      : super(ExceptionMessage(
          'Password is invalid. '
          'It must contain at least one upper case letter, '
          'one lower case letter, one number and '
          r'one of !$>_}.<"|+):/*+&^.',
        ));
}

/// [ServerException] is thrown when a call to an external
/// service, database, etc. does not complete normally. Errors, faults, etc.,
/// that can be expected are NOT exceptions.
class ServerException extends AppException {
  ServerException(ExceptionMessage message)
      : super(ExceptionMessage('Server exception. ${message.value}'));
}

/// [StringInvalidException] is thrown when an invalid value is detected that
/// cannot be handled otherwise.
class StringInvalidException extends AppException {
  StringInvalidException(ExceptionMessage message)
      : super(ExceptionMessage('Invalid value. ${message.value}'));
  //
  // String get message => super.message;
}

/// [StringLengthException] is thrown when a String, for example a Password,
/// contains fewer than the minimum number of characters. It takes an optional
/// [ExceptionMessage] that states the minimum requirement is six characters.
class StringLengthException extends ValueException {
  StringLengthException(ExceptionMessage? message)
      : super(message ?? ExceptionMessage('It must be a minimum of six characters.'));

  // String get message => super.message;
}

/// [UnsupportedException] is thrown when the requested action is not
/// supported by the application.
class UnsupportedException extends AppException {
  UnsupportedException(ExceptionMessage message)
      : super(ExceptionMessage('Unsupported exception. ${message.value}'));
}

/// [ValueException] is thrown when an invalid value is detected that cannot
/// be handled otherwise.
class ValueException extends AppException {
  ValueException(ExceptionMessage message)
      : super(ExceptionMessage('Invalid value. ${message.value}'));
}
