import 'package:unrepresentable_state/src/exceptions/exception_message.dart';
import 'package:unrepresentable_state/src/exceptions/exceptions.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart' show NonEmptyString;

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
