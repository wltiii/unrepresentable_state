import '../../unrepresentable_state.dart';

/// [Name] represents a user friendly name associated with an object. For
/// example:
///  * UserName
///  * FirstName
///  * LastName
///  * CompanyName
///
/// It is a [NonEmptyString], thus  must not be empty. Instantiating with an
/// empty String will throw a [ValueException].
///
/// Implementors should create unique types per the domain requirements in
/// accordance with Type Driven Design principles and practices.
///
abstract class Name extends NonEmptyString {
  Name(String value)
      : super(
          value,
        );
}
