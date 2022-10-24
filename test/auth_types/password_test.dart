import 'package:test/test.dart';
import 'package:unrepresentable_state/src/auth_types/validators.dart';
import 'package:unrepresentable_state/src/exceptions/exceptions.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('construction', () {
    test('constructs successfully', () {
      const value = r'pAs$w0rd';
      final password = Password(value);
      expect(password, isA<NonEmptyString>());
      expect(password.value, equals(value));
    });

    test('when password is empty string exception is thrown', () {
      try {
        print('creating password');
        Password('');
      } catch (e) {
        print('exception!');
        // StringLengthException f = e;
        // final f = e as StringLengthException;
        // print('threw exception ${f.message}');
        // print('threw exception ${e.message}');
      }

      expect(Password(''), throwsA(isA<StringLengthException>()));
      // expect(Password(''), throwsA(isA<StringLengthException>('Invalid value. It must be a minimum of six characters.')));
      // expect(
      //   () => Password(''),
      //   throwsA(isA(StringLengthException)
      //     // predicate((e) => e is StringLengthException
      //         // e is StringLengthException &&
      //         // e.message ==
      //         //     'Invalid value. '
      //         //         'Password must be a minimum of six characters.',
      //         ),
      //   ),
      // );
    });

    test('when less than six characters exception is thrown', () {
      const value = r'As0$';

      expect(
        () => Password(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. '
                        'Password must be a minimum of six characters.',
          ),
        ),
      );
    });

    test('when less than six characters function throws exception', () {
      const value = r'A';

      try {
        print('validating!');
        stringLengthValidator(value);
      } catch (e) {
        print('exception!');
        print('threw exception ${e}');
      }

      expect(
        () => stringLengthValidator(value),
        throwsA(
          predicate(
            (e) =>
                e is StringLengthException &&
                e.message ==
                    'Invalid value. '
                        'It must be a minimum of six characters.',
          ),
        ),
      );
    });

    test('when does not contain uppercase exception is thrown', () {
      const value = r'pas$w0rd';

      expect(
        () => Password(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. Password is invalid. It must contain at '
                        'least one upper case letter, one lower case letter, '
                        'one number and one of '
                        r'!$>_}.<"|+):/*+&^.',
          ),
        ),
      );
    });

    test('when does not contain lowercase exception is thrown', () {
      const value = r'PAS$W0RD';

      expect(
        () => Password(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. Password is invalid. It must contain at '
                        'least one upper case letter, one lower case letter, '
                        'one number and one of '
                        r'!$>_}.<"|+):/*+&^.',
          ),
        ),
      );
    });

    test('when does not contain number exception is thrown', () {
      const value = r'pAs$word';

      expect(
        () => Password(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. Password is invalid. It must contain at '
                        'least one upper case letter, one lower case letter, '
                        'one number and one of '
                        r'!$>_}.<"|+):/*+&^.',
          ),
        ),
      );
    });

    test('when does not contain special character exception is thrown', () {
      const value = 'pAssw0rd';

      expect(
        () => Password(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. Password is invalid. It must contain at '
                        'least one upper case letter, one lower case letter, '
                        'one number and one of '
                        r'!$>_}.<"|+):/*+&^.',
          ),
        ),
      );
    });
  });
}
