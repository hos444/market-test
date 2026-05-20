import 'package:flutter/foundation.dart';

class ApiEndpoints {
  // Base URL
  // Pointing to the live Hostinger server to match the React frontend
  static const String baseUrl = "https://weshelafasapi.fikriti.com/api/v1";

  // Auth Endpoints
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String logout = "/auth/logout";
  static const String profile = "/auth/user";

  // Catalog Endpoints
  static const String categories = "/categories";
  static const String crops = "/crops";

  // Listings Endpoints
  static const String publicListings = "/listings";
  static const String farmerListings = "/farmer/listings";
  static const String traderListings = "/trader/listings";

  // Orders Endpoints
  static const String farmerOrders = "/farmer/orders";
  static const String traderOrders = "/trader/orders";
  static const String institutionOrders = "/institution/orders";
  static const String createOrder = "/trader/orders";

  // Offers/Negotiation Endpoints
  static const String farmerOffers = "/farmer/offers";
  static const String traderOffers = "/trader/offers";
  static const String submitOffer = "/offers";
  static const String marketingOffers = "/offers";

  // Wallet Endpoints
  static const String wallet = "/wallet";
  static const String transactions = "/wallet/transactions";
  static const String addCredit = "/wallet/deposit";
}
