import 'package:intl/intl.dart';

class CategoryModel {
  final String id;
  final Map<String, dynamic>? nameTranslations;
  final String _staticName;
  final String? slug;
  final String? image;
  final List<CropModel>? crops;

  String get name {
    final currentLocale = Intl.defaultLocale ?? 'en';
    final langCode = currentLocale.split('_').first;
    if (nameTranslations != null) {
      return nameTranslations![langCode] ?? nameTranslations!['ar'] ?? nameTranslations!['en'] ?? _staticName;
    }
    return _staticName;
  }

  CategoryModel({
    required this.id,
    required String name,
    this.nameTranslations,
    this.slug,
    this.image,
    this.crops,
  }) : _staticName = name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? nameMap;
    String staticName = '';
    if (json['name'] is Map) {
      nameMap = json['name'] as Map<String, dynamic>;
      staticName = nameMap['en'] ?? nameMap['ar'] ?? '';
    } else {
      staticName = json['name']?.toString() ?? json['name_ar'] ?? json['name_en'] ?? '';
    }

    return CategoryModel(
      id: json['id'].toString(),
      name: staticName,
      nameTranslations: nameMap,
      slug: json['slug'],
      image: json['image'],
      crops: json['crops'] != null 
          ? (json['crops'] as List).map((i) => CropModel.fromJson(i)).toList()
          : null,
    );
  }
}

class CropModel {
  final String id;
  final Map<String, dynamic>? nameTranslations;
  final String _staticName;
  final String? image;
  final String categoryId;

  String get name {
    final currentLocale = Intl.defaultLocale ?? 'en';
    final langCode = currentLocale.split('_').first;
    if (nameTranslations != null) {
      return nameTranslations![langCode] ?? nameTranslations!['ar'] ?? nameTranslations!['en'] ?? _staticName;
    }
    return _staticName;
  }

  CropModel({
    required this.id,
    required String name,
    this.nameTranslations,
    this.image,
    required this.categoryId,
  }) : _staticName = name;

  factory CropModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? nameMap;
    String staticName = '';
    if (json['name'] is Map) {
      nameMap = json['name'] as Map<String, dynamic>;
      staticName = nameMap['en'] ?? nameMap['ar'] ?? '';
    } else {
      staticName = json['name']?.toString() ?? json['name_ar'] ?? json['name_en'] ?? '';
    }

    return CropModel(
      id: json['id'].toString(),
      name: staticName,
      nameTranslations: nameMap,
      image: json['image'],
      categoryId: json['category_id']?.toString() ?? '',
    );
  }
}
