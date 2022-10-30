import 'package:test/test.dart';
import 'package:unrepresentable_state/src/auth_types/validators.dart';
import 'package:unrepresentable_state/src/exceptions/exceptions.dart';

void main() {
  group('validates', () {
    group('string length', () {
      test('of six characters is valid', () {
        try {
          minStringLengthValidator('123456');
        }
        catch(e) {
          expect(e, isNull);
        }
      });

      test('of less than six characters exception is thrown', () {
        expect(
          () => minStringLengthValidator('12345'),
          throwsA(
            predicate(
              (e) =>
                  e is StringLengthException &&
                  e.message ==
                      'Invalid value. '
                          'It must be a minimum of 6 characters.',
            ),
          ),
        );
      });
    });

    group('string contains', () {
      test('upper, lower, number and special char is valid', () {
        try {
          minStringLengthValidator(r'pAs$w0rd');
        }
        catch(e) {
          expect(e, isNull);
        }
      });

      test('no uppercase exception is thrown', () {
        expect(
          () => stringContainsUppercase(r'pas$w0rd'),
          throwsA(
            predicate(
              (e) =>
                  e is StringFormatException &&
                  e.message == 'Password is invalid. '
                      'It must contain at least one upper case letter, '
                      'one lower case letter, one number and '
                      r'one of !$>_}.<"|+):/*+&^.',
            ),
          ),
        );
      });

      test('no lowercase exception is thrown', () {
        expect(
          () => stringContainsLowercase(r'PAS$W0RD'),
          throwsA(
            predicate(
              (e) =>
                  e is StringFormatException &&
                  e.message == 'Password is invalid. '
                    'It must contain at least one upper case letter, '
                    'one lower case letter, one number and '
                    r'one of !$>_}.<"|+):/*+&^.',
            ),
          ),
        );
      });

      test('no number exception is thrown', () {
        expect(
          () => stringContainsNumber(r'pAs$word'),
          throwsA(
            predicate(
              (e) =>
                  e is StringFormatException &&
                  e.message == 'Password is invalid. '
                      'It must contain at least one upper case letter, '
                      'one lower case letter, one number and '
                      r'one of !$>_}.<"|+):/*+&^.',
            ),
          ),
        );
      });

      test('no special char exception is thrown', () {
        expect(
          () => stringContainsSpecialChar(r'pAssw0rd'),
          throwsA(
            predicate(
              (e) =>
                  e is StringFormatException &&
                  e.message == 'Password is invalid. '
                      'It must contain at least one upper case letter, '
                      'one lower case letter, one number and '
                      r'one of !$>_}.<"|+):/*+&^.',
            ),
          ),
        );
      });
    });

  });
}
