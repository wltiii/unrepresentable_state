import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('LoginId', () {
    test('default constructs successfully', () {
      const value = r'billy';
      final loginId = Id(value);
      expect(loginId, isA<NonEmptyString>());
      expect(loginId.value, equals(value));
    });

    test('default throws exception when LoginId is empty', () {
      expect(
        () => Id(''),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. '
                        'Login id must not be empty.',
          ),
        ),
      );
    });

    test('factory timeBasedUuid constructs', () {
      final loginId = Id.timeBasedUuid();
      expect(loginId, isA<NonEmptyString>());
      expect(loginId.value.length, equals(36));
    });

    test('factory randomUuid constructs', () {
      final loginId = Id.randomUuid();
      expect(loginId, isA<NonEmptyString>());
      expect(loginId.value.length, equals(36));
    });

    test('factory namespaceUuid constructs', () {
      final namespace = NameSpaceUrl('https://www.google.com/)');
      final loginId = Id.namespaceUuid(namespace);
      expect(loginId, isA<NonEmptyString>());
      expect(loginId.value.length, equals(36));
    });
  });
}
