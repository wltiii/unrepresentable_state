import 'package:test/test.dart';
import 'package:unrepresentable_state/src/exceptions/exceptions.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class AppExceptionTester extends AppException {
  AppExceptionTester(ExceptionMessage message) : super(message);
}

void main() {
  test('AppException constructs successfully', () {
    const value = 'My what a pretty face you have!';
    final message = ExceptionMessage(value);
    final given = AppExceptionTester(message);
    expect(given.message, equals(value));
    expect(given.toString(), equals('My what a pretty face you have!'));
  });

  test('NotFoundException constructs successfully', () {
    const value = 'Additional message.';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Invalid value. $value';
    final given = NotFoundException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('NumberValueException constructs successfully', () {
    const value = 'Additional message.';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Invalid value. $value';
    final given = NumberValueException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('ServerException constructs successfully', () {
    const value = 'A server exception';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Server exception. $value';
    final given = ServerException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('StringFormatException.password() constructs successfully', () {
    const expectedMessage = 'Password is invalid. '
        'It must contain at least one upper case letter, '
        'one lower case letter, one number and '
        r'one of !$>_}.<"|+):/*+&^.';
    final given = StringFormatException.password();
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('StringInvalidException constructs successfully', () {
    const value = 'Additional message.';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Invalid value. $value';
    final given = StringInvalidException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('StringLengthException.defaultMessage constructs successfully', () {
    final expectedMessage = 'Invalid value. '
        'It must be a minimum of 6 characters.';
    final given = StringLengthException.sixRequired();
    expect(given, isA<AppException>());
    expect(given, isA<ValueException>());
    expect(given.message, equals(expectedMessage));
  });

  test('StringLengthException.withMessage constructs successfully', () {
    const value = 999;
    final expectedMessage = 'Invalid value. '
        'It must be a minimum of 999 characters.';
    final given = StringLengthException.minLength(value);
    expect(given, isA<AppException>());
    expect(given, isA<ValueException>());
    expect(given.message, equals(expectedMessage));
  });

  test('UnsupportedException constructs successfully', () {
    const value = 'Additional message.';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Unsupported exception. $value';
    final given = UnsupportedException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });

  test('ValueException constructs successfully', () {
    const value = 'Additional message.';
    final givenMessage = ExceptionMessage(value);
    final expectedMessage = 'Invalid value. $value';
    final given = ValueException(givenMessage);
    expect(given, isA<AppException>());
    expect(given.message, equals(expectedMessage));
  });
}
