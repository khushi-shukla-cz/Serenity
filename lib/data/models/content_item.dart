import 'package:hive/hive.dart';

part 'content_item.g.dart';

@HiveType(typeId: 1)
class ContentItem extends HiveObject {

  ContentItem({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.isFavorite = false,
  });

  factory ContentItem.fromJson(Map<String, dynamic> json) => ContentItem(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        imageUrl: json['imageUrl'] as String?,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        isFavorite: json['isFavorite'] as bool? ?? false,
      );
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String? imageUrl;

  @HiveField(4)
  DateTime createdAt;

  @HiveField(5)
  DateTime updatedAt;

  @HiveField(6)
  bool isFavorite;

  ContentItem copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isFavorite,
  }) => ContentItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'isFavorite': isFavorite,
      };

  @override
  String toString() =>
      'ContentItem(id: $id, title: $title, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isFavorite: $isFavorite)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContentItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          imageUrl == other.imageUrl &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          isFavorite == other.isFavorite;

  @override
  int get hashCode => Object.hash(
        id,
        title,
        description,
        imageUrl,
        createdAt,
        updatedAt,
        isFavorite,
      );
}
