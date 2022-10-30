import '../exceptions/exceptions.dart';

// TODO validators for min/max range and max only
void minStringLengthValidator(String value) =>
    {if (value.trimRight().length < 6) throw StringLengthException.sixRequired()};

void stringContainsLowercase(String value) =>
    {if (!value.contains(RegExp('[a-z]'))) throw StringFormatException.password()};

void stringContainsNumber(String value) =>
    {if (!value.contains(RegExp('[0-9]'))) throw StringFormatException.password()};

void stringContainsSpecialChar(String value) =>
    {if (!value.contains(RegExp(r'[!$>_}.<"|+):/*&^]'))) throw StringFormatException.password()};

void stringContainsUppercase(String value) =>
    {if (!value.contains(RegExp('[A-Z]'))) throw StringFormatException.password()};
