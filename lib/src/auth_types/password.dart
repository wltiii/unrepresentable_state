import 'package:unrepresentable_state/src/auth_types/validators.dart';
import 'package:unrepresentable_state/unrepresentable_state.dart' show NonEmptyString;

/// [Password] is a container for a validated password.
///
/// It appears Firebase authentication only validates that passwords are a
/// minimum of six characters. Therefore, we have added a few additional rules.
///
class Password extends NonEmptyString {
  Password(
    String value, {
    List<Function>? validators,
  }) : super(
          value,
          validators: validators ?? []
            ..addAll(_defaultValidators),
        );
}

final List<Function> _defaultValidators = [
  (String value) => minStringLengthValidator(value),
  (String value) => stringContainsLowercase(value),
  (String value) => stringContainsUppercase(value),
  (String value) => stringContainsNumber(value),
  (String value) => stringContainsSpecialChar(value),
];
