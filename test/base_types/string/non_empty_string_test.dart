import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';


class NonEmptyStringTester extends NonEmptyString {
  NonEmptyStringTester(String value) : super(value);
}

void main() {
  group('construction', () {
    test('constructs', () {
      const value = 'My what a pretty face you have!';
      final aString = NonEmptyStringTester(value);
      expect(aString, isA<MaybeEmptyString>());
      expect(aString, isA<NonEmptyString>());
      expect(aString, isA<Equatable>());
      expect(aString.value, equals(value));
    });

    test('throws when string has zero length', () {
      expect(
        () => NonEmptyStringTester(''),
        throwsA(
          predicate(
            (e) => e is StringInvalidException && e.message == 'Invalid value.',
          ),
        ),
      );
    });

    test('throws when string of spaces only', () {
      expect(
        () => NonEmptyStringTester(' '),
        throwsA(
          predicate(
            (e) => e is StringInvalidException && e.message == 'Invalid value.',
          ),
        ),
      );
    });
  });
}
