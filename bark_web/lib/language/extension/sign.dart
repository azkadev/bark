import 'package:bark_web/language/language.dart';

extension LanguageAppSignExtension on LanguageApp {
  String sign_with_msg_error_not_found_app_or_server({
    LanguageCodeType? languageCodeType,
  }) {
    languageCodeType ??= languageCodeType;
    if (languageCodeType == LanguageCodeType.en) {
      return "We can't find app message on your device\nPlease open App message and don't close, and try again\nif app not installed please download first";
    }
    if (languageCodeType == LanguageCodeType.jawa_ngoko) {
      return "Dewek Ora teyeng nemu app message neng device'e ko\nTulung buka App aja di close ngko teken jajal maning\nNek app urung di install install disit";
    }

    if (languageCodeType == LanguageCodeType.jaksel) {
      return "";
    }

    return "Kami tidak bisa menemukan app message di device anda\nTolong buka app jangan di close lalu tap try again\nJika app belum terinstall silahkan download dahulu";
  }
}
