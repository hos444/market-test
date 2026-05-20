import '../../../auth/data/models/user_model.dart';
import '../../../listings/data/models/listing_model.dart';

class OrderModel {
  final String id;
  final String orderNumber;
  final double totalAmount;
  final String status;
  final String? paymentStatus;
  final String? shippingAddress;
  final List<OrderItemModel> items;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.orderNumber,
    required this.totalAmount,
    required this.status,
    this.paymentStatus,
    this.shippingAddress,
    required this.items,
    required this.createdAt,
  });

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'].toString(),
      orderNumber: json['order_number'] ?? json['id'].toString(),
      totalAmount: _parseDouble(json['total_price'] ?? json['total_amount']),
      status: json['status'] ?? 'pending',
      paymentStatus: json['payment_status'],
      shippingAddress: json['shipping_address'],
      items: (json['items'] as List? ?? [])
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) ?? DateTime.now() : DateTime.now(),
    );
  }
}

class OrderItemModel {
  final String id;
  final String listingId;
  final ListingModel? listing;
  final double quantity;
  final double price;

  OrderItemModel({
    required this.id,
    required this.listingId,
    this.listing,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'].toString(),
      listingId: json['listing_id']?.toString() ?? '',
      listing: json['listing'] != null ? ListingModel.fromJson(json['listing']) : null,
      quantity: OrderModel._parseDouble(json['quantity']),
      price: OrderModel._parseDouble(json['unit_price'] ?? json['price']),
    );
  }
}
