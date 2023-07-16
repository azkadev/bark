import 'language_code_type.dart';

class LanguageApp {
  LanguageCodeType language_code_type = LanguageCodeType.id;
  LanguageApp({
    LanguageCodeType? languageCodeType,
  }) {
    languageCodeType ??= LanguageCodeType.id;
    language_code_type = languageCodeType;
  }
}
