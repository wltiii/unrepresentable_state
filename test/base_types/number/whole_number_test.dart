import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/src/base_types/number/whole_number.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

class WholeNumberTester extends WholeNumber {
  WholeNumberTester(int value) : super(value);
}

void main() {
  group('WholeNumber', () {
    test('constructs successfully', () {
      const value = 0;
      final result = WholeNumberTester(value);
      expect(result, isA<Equatable>());
      expect(result.value, equals(value));
      expect(result.props, equals([value]));
      expect(result.stringify, equals(true));
    });

    test('throws exception when value is less than 1', () {
      expect(
        () => WholeNumberTester(-1),
        throwsA(
          predicate(
            (e) =>
                e is NumberValueException &&
                e.message == 'Invalid value. The number cannot be less than zero.',
          ),
        ),
      );
    });
  });
}
