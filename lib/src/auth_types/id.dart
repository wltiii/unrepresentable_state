import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../../unrepresentable_state.dart';

/// [Id] is a unique identifier of a user.
///
/// It is a [NonEmptyString], thus  must not be empty. Instantiating with an
/// empty String will throw a [ValueException].
///
class Id extends NonEmptyString {
  Id(String value)
      : super(
          value,
          validators: [
            (String value) => {
                  if (value.trimRight().isEmpty)
                    throw ValueException(
                      ExceptionMessage('Login id must not be empty.'),
                    ),
                },
          ],
        );

  factory Id.timeBasedUuid() {
    final uuid = Uuid().v1(options: {
      'node': [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
      'clockSeq': 0x1234,
      'mSecs': DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
      'nSecs': 5678
    }).toString();
    return Id(uuid);
  }

  factory Id.randomUuid() {
    final uuid = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG}).toString();
    return Id(uuid);
  }

  factory Id.namespaceUuid(NameSpaceUrl namespace) {
    final uuid = Uuid().v5(Uuid.NAMESPACE_URL, namespace.value).toString();
    return Id(uuid);
  }
}
