import '../base_types/string/non_empty_string.dart';
import '../exceptions/exception_message.dart';
import '../exceptions/exceptions.dart';

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
      // (String value) => passwordLengthValidator(value),
  (String value) =>
      {if (value.trimRight().length < 6) throw _passwordLengthException},
  //     (String value) => passwordContainsUppercase(value),
  (String value) =>
      {if (!value.contains(RegExp('[A-Z]'))) throw _passwordFormatException},
      // (String value) => passwordContainsLowercase(value),
  (String value) =>
      {if (!value.contains(RegExp('[a-z]'))) throw _passwordFormatException},
      // (String value) => passwordContainsNumber(value),
  (String value) =>
      {if (!value.contains(RegExp('[0-9]'))) throw _passwordFormatException},
      // (String value) => passwordContainsSpecialChar(value),
  (String value) => {
        if (!value.contains(RegExp(r'[!$>_}.<"|+):/*&^]')))
          throw _passwordFormatException,
      },
];

// passwordLengthValidator(String value) =>
//     {if (value.trimRight().length < 6) throw _passwordLengthException};
//
// passwordContainsUppercase(String value) => (String value) =>
//   {if (!value.contains(RegExp('[A-Z]'))) throw _passwordFormatException};
//
// passwordContainsLowercase(String value) => (String value) =>
//   {if (!value.contains(RegExp('[a-z]'))) throw _passwordFormatException};
//
// passwordContainsNumber(String value) => (String value) =>
//   {if (!value.contains(RegExp('[0-9]'))) throw _passwordFormatException};
//
// passwordContainsSpecialChar(String value) => (String value) =>
//   {if (!value.contains(RegExp(r'[!$>_}.<"|+):/*+&^]'))) throw _passwordFormatException};

final _passwordLengthException = ValueException(
  ExceptionMessage('Password must be a minimum of six characters.'),
);

final _passwordFormatException = ValueException(
  ExceptionMessage(
    'Password is invalid. '
    'It must contain at least one upper case letter, '
    'one lower case letter, one number and '
    r'one of !$>_}.<"|+):/*+&^.',
  ),
);
