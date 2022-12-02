import 'package:test/test.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart';

void main() {
  group('Id', () {
    test('default constructs successfully', () {
      const value = r'billy';
      final id = Id(value);
      expect(id, isA<NonEmptyString>());
      expect(id.value, equals(value));
    });

    test('default throws exception when Id is empty', () {
      expect(
        () => Id(''),
        throwsA(
          predicate(
            (e) =>
                e is ValueException &&
                e.message ==
                    'Invalid value. '
                        'Id must not be empty.',
          ),
        ),
      );
    });

    test('factory timeBasedUuid constructs', () {
      final id = Id.timeBasedUuid();
      expect(id, isA<NonEmptyString>());
      expect(id.value.length, equals(36));
    });

    test('factory randomUuid constructs', () {
      final id = Id.randomUuid();
      expect(id, isA<NonEmptyString>());
      expect(id.value.length, equals(36));
    });

    test('factory namespaceUuid constructs', () {
      final namespace = NameSpaceUrl('https://www.google.com/)');
      final id = Id.namespaceUuid(namespace);
      expect(id, isA<NonEmptyString>());
      expect(id.value.length, equals(36));
    });
  });
}
