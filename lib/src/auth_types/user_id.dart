import '../base_types/string/non_empty_string.dart';
import '../exceptions/exception_message.dart';
import '../exceptions/exceptions.dart';

/// [UserId] is a unique identifier of a user.
///
/// It is a [NonEmptyString], thus  must not be empty. Instantiating with an
/// empty String will throw a [ValueException].
///
// TODO(wltiii): allow empty and generate a unique id???
// TODO(wltiii): or use StoreMetaData???
class UserId extends NonEmptyString {
  UserId(String value)
      : super(
    value,
    validators: [
          (String value) => {
        if (value.trimRight().isEmpty)
          throw ValueException(
            ExceptionMessage('User id must not be empty.'),
          ),
      },
    ],
  );
}
