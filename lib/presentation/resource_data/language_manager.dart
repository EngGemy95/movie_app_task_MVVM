enum LanguageType { english, arabic }

const String arabic = "ar";
const String english = "en";

extension LanguageTypeExtension on LanguageType {
  String getLanguageValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
