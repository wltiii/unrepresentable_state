import 'package:test/test.dart';
import 'package:unrepresentable_state/src/exceptions/exceptions.dart'
    show StringFormatException, StringLengthException;
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('Password', () {
    const validPassword = r'aB3$56';
    const shortPassword = r'aB3$5';
    const noLower = r'AB3$56';
    const noUpper = r'ab3$56';
    const noNumber = r'aBc$ef';
    const noSpecialChar = r'aB3456';

    test('successfully constructs', () {
      final password = Password(validPassword);
      expect(password, isA<NonEmptyString>());
      expect(password.value, equals(validPassword));
    });

    test('when any default format validation fails exception is thrown', () {
      expect(() {
        Password(shortPassword);
      }, throwsA(isA<StringLengthException>()));

      expect(() {
        Password(noLower);
      }, throwsA(isA<StringFormatException>()));

      expect(() {
        Password(noUpper);
      }, throwsA(isA<StringFormatException>()));

      expect(() {
        Password(noNumber);
      }, throwsA(isA<StringFormatException>()));

      expect(() {
        Password(noSpecialChar);
      }, throwsA(isA<StringFormatException>()));
    });
  });
}
