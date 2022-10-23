import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../../unrepresentable_state.dart';
import '../exceptions/exception_message.dart';

/// [LoginId] is a unique identifier of a user.
///
/// It is a [NonEmptyString], thus  must not be empty. Instantiating with an
/// empty String will throw a [ValueException].
///
class LoginId extends NonEmptyString {
  LoginId(String value)
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

  factory LoginId.timeBasedUuid() {
    final uuid = Uuid().v1(options: {
      'node': [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
      'clockSeq': 0x1234,
      'mSecs': DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
      'nSecs': 5678
    }).toString();
    return LoginId(uuid);
  }

  factory LoginId.randomUuid() {
    final uuid = Uuid().v4(options: {'rng': UuidUtil.cryptoRNG}).toString();
    return LoginId(uuid);
  }

  factory LoginId.namespaceUuid(NameSpaceUrl namespace) {
    final uuid = Uuid().v5(Uuid.NAMESPACE_URL, namespace.value).toString();
    return LoginId(uuid);
  }
}
