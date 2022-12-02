import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class NameTester extends Name {
  NameTester(String value) : super(value);
}

void main() {
  group('Name', () {
    test('constructs successfully', () {
      const value = 'aName';
      final result = NameTester(value);
      expect(result, isA<Equatable>());
      expect(result, isA<NonEmptyString>());
      expect(result.value, equals(value));
      expect(result.props, equals([value]));
      expect(result.stringify, equals(true));
    });
  });
}
