import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('ExceptionMessage', () {
    test('constructs with string', () {
      const value = 'My what a pretty face you have!';
      final given = ExceptionMessage(value);
      expect(given, isA<MaybeEmptyString>());
      expect(given, isA<NonEmptyString>());
      expect(given, isA<Equatable>());
      expect(given.value, equals(value));
    });
  });
}
