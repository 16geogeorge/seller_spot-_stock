import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:seller_spot_stock/api/seller_sopt_error.dart';
import 'package:seller_spot_stock/util/seller_spot_preference.dart';

class ImageRecoLocalization {
  ImageRecoLocalization(this.locale);

  final Locale locale;
  static List<String> supportedLanguages = ['en'];
  static String ImageRecoAppLocale;

  static ImageRecoLocalization of(BuildContext context) {
    return Localizations.of<ImageRecoLocalization>(
        context, ImageRecoLocalization);
  }

  static Map<String, Map<String, String>> get localizedValues =>
      _localizedValues;

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'message': 'Message',
      'ok': 'OK',
      'server_communication_failed': 'Unable to communicate with the server',

    }

  };

  String get messages {
    return _localizedValues[ImageRecoAppLocale]['messages'];
  }
  String get server_communication_failed {
    return _localizedValues[ImageRecoAppLocale]['server_communication_failed'];
  }

  String get ok {
    return _localizedValues[ImageRecoAppLocale]['ok'];
  }
  static setAppLanguage(String localeCode) {
    if (supportedLanguages.contains(localeCode)) {
      ImageRecoAppLocale = localeCode;
      _setAppLocale(ImageRecoAppLocale);
    } else {
      ImageRecoAppLocale = 'en';
      _setAppLocale(ImageRecoAppLocale);
    }
    ImageRecoError.setImageRecoErrorMessage();
  }
  //setting app language as english
  static _setAppLocale(String localeCode) async {
    ImageRecoSharedPreference prefs = new ImageRecoSharedPreference();
    prefs.setString(PreferenceKey.APP_LANGUAGE, localeCode);
  }

}

class ImageRecoLocalizationsDelegate extends LocalizationsDelegate<ImageRecoLocalization> {
  const ImageRecoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ImageRecoLocalization.supportedLanguages.contains(locale.languageCode);

  @override
  Future<ImageRecoLocalization> load(Locale locale) {
    return new SynchronousFuture<ImageRecoLocalization>(new ImageRecoLocalization(locale));
  }

  @override
  bool shouldReload(ImageRecoLocalizationsDelegate old) => false;
}