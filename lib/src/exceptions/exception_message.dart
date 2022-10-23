import '../base_types/string/non_empty_string.dart';

/// [ExceptionMessage] contains a human readable, and often user friendly,
/// statement of an exceptional condition. It is extended from [NonEmptyString],
/// thus must not be empty.
class ExceptionMessage extends NonEmptyString {
  ExceptionMessage(String value) : super(value);
}
