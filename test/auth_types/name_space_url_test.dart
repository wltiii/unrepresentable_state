import 'package:equatable/equatable.dart';
import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('construction', () {
    test('when valid namespace object is constructed', () {
      const value = 'www.changent.com';
      final given = NameSpaceUrl(value);
      expect(given, isA<MaybeEmptyString>());
      expect(given, isA<NonEmptyString>());
      expect(given, isA<Equatable>());
      expect(given.value, equals(value));
    });

    test('when namespace is invalid exception is thrown', () {
      const value = ':: gobbledy gook ::';

      expect(
        () => NameSpaceUrl(value),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. '
                        'NamespaceUrl is invalid.',
          ),
        ),
      );
    });
  });
}
