import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/src/base_types/number/natural_number.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class NaturalNumberTester extends NaturalNumber {
  NaturalNumberTester(int value) : super(value);
}

void main() {
  group('NaturalNumber', () {
    test('constructs successfully', () {
      const value = 1;
      final result = NaturalNumberTester(value);
      expect(result, isA<Equatable>());
      expect(result.value, equals(value));
      expect(result.props, equals([value]));
      expect(result.stringify, equals(true));
    });

    test('throws exception when value is less than 1', () {
      expect(
        () => NaturalNumberTester(0),
        throwsA(
          predicate(
            (e) =>
                e is NumberValueException &&
                e.message == 'Invalid value. The number cannot be less than one.',
          ),
        ),
      );
    });
  });
}
