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

/// [ServerException] is thrown when a call to an external
/// service, database, etc. does not complete normally. Errors, faults, etc.,
/// that can be expected are NOT exceptions.
class ServerException extends AppException {
  ServerException(ExceptionMessage message)
      : super(ExceptionMessage('Server exception. ${message.value}'));
}

/// [StringFormatException] is thrown when a String does not meet formatting
/// requirements. It is implemented through factory constructors.
///
/// [StringFormatException.password] is thrown when a Password is improperly formatted,
/// i.e. it has one upper case letter, one lower case letter, one number and one
/// special character of !$>_}.<"|+):/*+&^..
class StringFormatException extends AppException {
  StringFormatException._(ExceptionMessage message) : super(message);

  factory StringFormatException.password() {
    return StringFormatException._(
      ExceptionMessage(
        'Password is invalid. '
            'It must contain at least one upper case letter, '
            'one lower case letter, one number and '
        r'one of !$>_}.<"|+):/*+&^.',
      ),
    );
  }
}

/// [StringInvalidException] is thrown when an invalid value is detected that
/// cannot be handled otherwise.
class StringInvalidException extends AppException {
  StringInvalidException(ExceptionMessage message)
      : super(ExceptionMessage('Invalid value. ${message.value}'));
}

// TODO allow for min/max range and max only
/// [StringLengthException] is thrown when a String, for example a Password,
/// contains fewer than the minimum number of characters.
///
/// [StringLengthException.sixRequired] states that the minimum allowable
/// length of the string is six characters.
///
/// [StringLengthException.minLength] Takes an integer for that represents the
/// minimum allowable length of the string and constructs an exception
/// therefrom. For example:
///
/// ```dart
/// expect(
///     StringLengthException.minLength(999).message,
///     equals('Invalid value. '
///        'It must be a minimum of 999 characters.'),
/// );
/// [UnsupportedException] is thrown when the requested action is not
class StringLengthException extends ValueException {
  StringLengthException._(ExceptionMessage message) : super(message);

  factory StringLengthException.sixRequired() {
    return StringLengthException._(_exception(6));
  }

  factory StringLengthException.minLength(int minLength) {
    return StringLengthException._(_exception(minLength));
  }

  static ExceptionMessage _exception(int value) =>
      ExceptionMessage('It must be a minimum of $value characters.');
}

/// ```
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
