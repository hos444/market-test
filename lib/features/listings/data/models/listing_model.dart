import '../../../catalog/data/models/category_model.dart';
import '../../../auth/data/models/user_model.dart';
import 'package:intl/intl.dart';

class ListingModel {
  final String id;
  final Map<String, dynamic>? titleTranslations;
  final Map<String, dynamic>? descriptionTranslations;
  final String _staticTitle;
  final String? _staticDescription;

  String get title {
    final currentLocale = Intl.defaultLocale ?? 'en';
    final langCode = currentLocale.split('_').first;
    if (titleTranslations != null) {
      return titleTranslations![langCode] ?? titleTranslations!['en'] ?? titleTranslations!['ar'] ?? _staticTitle;
    }
    return _staticTitle;
  }

  String? get description {
    final currentLocale = Intl.defaultLocale ?? 'en';
    final langCode = currentLocale.split('_').first;
    if (descriptionTranslations != null) {
      return descriptionTranslations![langCode] ?? descriptionTranslations!['en'] ?? descriptionTranslations!['ar'] ?? _staticDescription;
    }
    return _staticDescription;
  }

  // To truly support dynamic switching, we'll store the maps
  // and add a method that takes context or locale string.
  String getLocalizedTitle(String locale) {
    if (titleTranslations != null) {
      return titleTranslations![locale] ?? titleTranslations!['ar'] ?? titleTranslations!['en'] ?? _staticTitle;
    }
    return _staticTitle;
  }

  String? getLocalizedDescription(String locale) {
    if (descriptionTranslations != null) {
      return descriptionTranslations![locale] ?? descriptionTranslations!['ar'] ?? descriptionTranslations!['en'] ?? _staticDescription;
    }
    return _staticDescription;
  }
  final double quantity;
  final double? minOrderQuantity;
  final String unit;
  final double price;
  final String? image;
  final String? cropId;
  final CropModel? crop;
  final String? userId;
  final UserModel? user;
  final String status;
  final String? address;
  final String? qualityGrade;
  final String? storageInformation;
  final String? expiryDuration;
  final String? harvestDate;
  final String? usage;

  ListingModel({
    required this.id,
    required String title,
    String? description,
    this.titleTranslations,
    this.descriptionTranslations,
    required this.quantity,
    this.minOrderQuantity,
    required this.unit,
    required this.price,
    this.image,
    this.cropId,
    this.crop,
    this.userId,
    this.user,
    required this.status,
    this.address,
    this.qualityGrade,
    this.storageInformation,
    this.expiryDuration,
    this.harvestDate,
    this.usage,
  })  : _staticTitle = title,
        _staticDescription = description;

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? titleMap;
    String staticTitle = '';
    if (json['title'] is Map) {
      titleMap = json['title'] as Map<String, dynamic>;
      staticTitle = titleMap['en'] ?? titleMap['ar'] ?? '';
    } else {
      staticTitle = json['title']?.toString() ?? '';
    }

    Map<String, dynamic>? descMap;
    String? staticDesc;
    if (json['description'] is Map) {
      descMap = json['description'] as Map<String, dynamic>;
      staticDesc = descMap['en'] ?? descMap['ar'];
    } else {
      staticDesc = json['description']?.toString();
    }

    return ListingModel(
      id: json['id'].toString(),
      title: staticTitle,
      description: staticDesc,
      titleTranslations: titleMap,
      descriptionTranslations: descMap,
      quantity: _parseDouble(json['quantity']),
      minOrderQuantity: _parseDouble(json['min_order_quantity']),
      unit: json['unit'] ?? 'kg',
      price: _parseDouble(json['price_per_unit'] ?? json['price']),
      image: json['image'],
      cropId: json['crop_id']?.toString(),
      crop: json['crop'] != null ? CropModel.fromJson(json['crop']) : null,
      userId: (json['user_id'] ?? json['tenant_id'])?.toString(),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      status: json['status'] ?? 'pending',
      address: json['address'],
      qualityGrade: json['quality_grade'],
      storageInformation: json['storage_information'],
      expiryDuration: json['expiry_duration'],
      harvestDate: json['harvest_date'],
      usage: json['usage'],
    );
  }
}
