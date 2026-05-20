import 'package:finall_app/features/listings/data/models/listing_model.dart';

class CartItemModel {
  final ListingModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });
}