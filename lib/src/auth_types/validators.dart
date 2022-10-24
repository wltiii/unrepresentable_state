import '../exceptions/exceptions.dart';

void stringLengthValidator(String value) =>
    {if (value.trimRight().length < 6) throw StringLengthException()};

passwordContainsUppercase(String value) =>
    (String value) => {if (!value.contains(RegExp('[A-Z]'))) throw PasswordFormatException};

passwordContainsLowercase(String value) =>
    (String value) => {if (!value.contains(RegExp('[a-z]'))) throw PasswordFormatException};

passwordContainsNumber(String value) =>
    (String value) => {if (!value.contains(RegExp('[0-9]'))) throw PasswordFormatException};

passwordContainsSpecialChar(String value) => (String value) =>
    {if (!value.contains(RegExp(r'[!$>_}.<"|+):/*+&^]'))) throw PasswordFormatException};
