/// This is the main library (barrel) file. It is placed directly under lib.
/// Use it to provide developers with an overview of the entire public API of the package.
/// Also, to avoid exposing more API than intended.
///
/// Add exports and use show to specify exactly which symbols you wish to expose. For example,
/// given you wish to expose file 'add_chunked_encoding.dart' as 'addChunkedEncoding', and this
/// file is located in folder 'middleware' which itself is located in the 'src' folder, you
/// would write the following statement.
///
/// ```dart
/// export 'src/middleware/add_chunked_encoding.dart' show addChunkedEncoding;
/// ```
///
/// For more about organizing a library file, see:
///   https://dart.dev/guides/libraries/create-library-packages#organizing-a-library-package
///
/// Document the package api well. See:
///   https://dart.dev/guides/libraries/create-library-packages#documenting-a-library and
///   https://dart.dev/guides/language/effective-dart/documentation
///

