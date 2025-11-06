import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 2)
class SettingsModel extends HiveObject {

  SettingsModel({
    this.isDarkMode = false,
    this.languageCode = 'en',
    this.notificationsEnabled = true,
    this.soundEnabled = true,
    this.vibrationEnabled = true,
    this.fontSize = 14.0,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        isDarkMode: json['isDarkMode'] as bool? ?? false,
        languageCode: json['languageCode'] as String? ?? 'en',
        notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
        soundEnabled: json['soundEnabled'] as bool? ?? true,
        vibrationEnabled: json['vibrationEnabled'] as bool? ?? true,
        fontSize: (json['fontSize'] as num?)?.toDouble() ?? 14.0,
      );
  @HiveField(0)
  bool isDarkMode;

  @HiveField(1)
  String languageCode;

  @HiveField(2)
  bool notificationsEnabled;

  @HiveField(3)
  bool soundEnabled;

  @HiveField(4)
  bool vibrationEnabled;

  @HiveField(5)
  double fontSize;

  SettingsModel copyWith({
    bool? isDarkMode,
    String? languageCode,
    bool? notificationsEnabled,
    bool? soundEnabled,
    bool? vibrationEnabled,
    double? fontSize,
  }) => SettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
      fontSize: fontSize ?? this.fontSize,
    );

  Map<String, dynamic> toJson() => {
        'isDarkMode': isDarkMode,
        'languageCode': languageCode,
        'notificationsEnabled': notificationsEnabled,
        'soundEnabled': soundEnabled,
        'vibrationEnabled': vibrationEnabled,
        'fontSize': fontSize,
      };

  @override
  String toString() =>
      'SettingsModel(isDarkMode: $isDarkMode, languageCode: $languageCode, notificationsEnabled: $notificationsEnabled, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, fontSize: $fontSize)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModel &&
          runtimeType == other.runtimeType &&
          isDarkMode == other.isDarkMode &&
          languageCode == other.languageCode &&
          notificationsEnabled == other.notificationsEnabled &&
          soundEnabled == other.soundEnabled &&
          vibrationEnabled == other.vibrationEnabled &&
          fontSize == other.fontSize;

  @override
  int get hashCode => Object.hash(
        isDarkMode,
        languageCode,
        notificationsEnabled,
        soundEnabled,
        vibrationEnabled,
        fontSize,
      );
}
