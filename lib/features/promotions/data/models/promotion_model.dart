import '../../../listings/data/models/listing_model.dart';

class PromotionModel {
  final String id;
  final String name;
  final String? description;
  final String? discountType;
  final double discountValue;
  final String? image;
  final String? imageUrl;
  final List<ListingModel> listings;

  PromotionModel({
    required this.id,
    required this.name,
    this.description,
    this.discountType,
    required this.discountValue,
    this.image,
    this.imageUrl,
    required this.listings,
  });

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'],
      discountType: json['discount_type'],
      discountValue: (json['discount_value'] ?? 0.0).toDouble(),
      image: json['image'],
      imageUrl: json['image_url'],
      listings: (json['listings'] as List?)
              ?.map((e) => ListingModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
