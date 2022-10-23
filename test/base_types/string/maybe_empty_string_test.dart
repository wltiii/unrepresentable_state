import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/src/exceptions/exception_message.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class MaybeEmptyStringTester extends MaybeEmptyString {
  MaybeEmptyStringTester(
    String value, {
    List<Function>? validators,
  }) : super(value, validators: validators);
}

void main() {
  group('MaybeEmptyString', () {
    test('constructs with string', () {
      const value = 'My what a pretty face you have!';
      final aString = MaybeEmptyStringTester(value);
      expect(aString, isA<MaybeEmptyString>());
      expect(aString, isA<Equatable>());
      expect(aString.value, equals(value));
    });

    test('constructs with empty string', () {
      expect(MaybeEmptyStringTester('').value, equals(''));
    });

    test('constructs with spaces only', () {
      expect(MaybeEmptyStringTester(' ').value, equals(''));
    });

    test('constructs trimming right', () {
      final given = 'I will not have a trailing space after construction ';
      final expected = 'I will not have a trailing space after construction';
      expect(MaybeEmptyStringTester(given).value, equals(expected));
    });

    test('constructs with validators', () {
      final givenValidators = [
        (String value) => {
              if (value.trimRight().isEmpty)
                throw ValueException(
                  ExceptionMessage('Must not be empty.'),
                ),
            },
      ];

      const value = 'My what a pretty face you have!';
      final aString = MaybeEmptyStringTester(value, validators: givenValidators);
      expect(aString.value, equals(value));
    });
  });
}
