import '../base_types/string/non_empty_string.dart';
import '../exceptions/exception_message.dart';
import '../exceptions/exceptions.dart';

class NameSpaceUrl extends NonEmptyString {
  NameSpaceUrl(String value)
      : super(
          value,
          validators: [
            (String value) => {
                  if (Uri.tryParse(value) == null)
                    throw ValueException(
                      ExceptionMessage('NamespaceUrl is invalid.'),
                    ),
                },
          ],
        );
}
