import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../get_it.dart';
import '../services/storage_service.dart';

class LocaleController extends GetxController {
  final _storageService = getIt<StorageService>();
  static const String _localeKey = 'locale';

  final Rx<Locale> _locale = const Locale('en', 'US').obs;

  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _loadLocaleFromStorage();
  }

  void _loadLocaleFromStorage() {
    final localeCode = _storageService.getString(_localeKey);
    if (localeCode != null) {
      _locale.value = _getLocaleFromCode(localeCode);
    }
  }

  void changeLocale(String languageCode) {
    final newLocale = _getLocaleFromCode(languageCode);
    _locale.value = newLocale;
    _storageService.setString(_localeKey, languageCode);
    Get.updateLocale(newLocale);
  }

  Locale _getLocaleFromCode(String code) {
    switch (code) {
      case 'en':
        return const Locale('en', 'US');
      case 'es':
        return const Locale('es', 'ES');
      case 'fr':
        return const Locale('fr', 'FR');
      case 'de':
        return const Locale('de', 'DE');
      default:
        return const Locale('en', 'US');
    }
  }
}
