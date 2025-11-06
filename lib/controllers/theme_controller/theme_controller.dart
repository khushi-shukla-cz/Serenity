import 'package:get/get.dart';
import '../../get_it.dart';
import '../services/storage_service.dart';

class ThemeController extends GetxController {
  final _storageService = getIt<StorageService>();
  static const String _themeKey = 'theme_mode';

  final _isDarkMode = false.obs;

  bool get isDarkMode => _isDarkMode.value;
  ThemeMode get themeMode => _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    final isDark = _storageService.getBool(_themeKey) ?? false;
    _isDarkMode.value = isDark;
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _storageService.setBool(_themeKey, _isDarkMode.value);
  }

  void setLightTheme() {
    _isDarkMode.value = false;
    _storageService.setBool(_themeKey, false);
  }

  void setDarkTheme() {
    _isDarkMode.value = true;
    _storageService.setBool(_themeKey, true);
  }
}
