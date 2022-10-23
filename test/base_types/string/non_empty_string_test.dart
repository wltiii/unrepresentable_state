import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class NonEmptyStringTester extends NonEmptyString {
  NonEmptyStringTester(String value) : super(value);
}

void main() {
  group('NonEmptyString', () {
    test('constructs successfully', () {
      const value = 'My what a pretty face you have!';
      final aString = NonEmptyStringTester(value);
      expect(aString, isA<MaybeEmptyString>());
      expect(aString, isA<NonEmptyString>());
      expect(aString, isA<Equatable>());
      expect(aString.value, equals(value));
      expect(aString.props, equals([value]));
      expect(aString.stringify, equals(true));
    });

    test('when string has zero length exception is thrown', () {
      expect(
        () => NonEmptyStringTester(''),
        throwsA(
          predicate(
            (e) =>
                e is StringInvalidException && e.message == 'Invalid value. It must not be empty.',
          ),
        ),
      );
    });

    test('when string of spaces only exception is thrown', () {
      expect(
        () => NonEmptyStringTester(' '),
        throwsA(
          predicate(
            (e) =>
                e is StringInvalidException && e.message == 'Invalid value. It must not be empty.',
          ),
        ),
      );
    });
  });
}
