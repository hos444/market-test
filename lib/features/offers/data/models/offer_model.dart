import '../../../listings/data/models/listing_model.dart';
import '../../../auth/data/models/user_model.dart';

class OfferModel {
  final String id;
  final String listingId;
  final ListingModel? listing;
  final String userId;
  final UserModel? user;
  final double amount;
  final String status; // pending, accepted, rejected
  final String? note;
  final DateTime createdAt;

  OfferModel({
    required this.id,
    required this.listingId,
    this.listing,
    required this.userId,
    this.user,
    required this.amount,
    required this.status,
    this.note,
    required this.createdAt,
  });

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'].toString(),
      listingId: json['listing_id']?.toString() ?? '',
      listing:
          json['listing'] != null
              ? ListingModel.fromJson(json['listing'])
              : null,
      userId: json['user_id']?.toString() ?? '',
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      amount: _parseDouble(json['amount']),
      status: json['status'] ?? 'pending',
      note: json['note'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at']) ?? DateTime.now()
              : DateTime.now(),
    );
  }
}
