import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/offer_model.dart';

abstract class OffersRemoteDataSource {
  Future<List<OfferModel>> getFarmerOffers();
  Future<List<OfferModel>> getTraderOffers();
  Future<void> submitOffer(Map<String, dynamic> data);
  Future<void> respondToOffer(String id, String status);
}

class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final ApiClient _client;

  OffersRemoteDataSourceImpl(this._client);

  @override
  Future<List<OfferModel>> getFarmerOffers() async {
    final response = await _client.get(ApiEndpoints.farmerOffers);
    final List data = response.data['data'];
    return data.map((e) => OfferModel.fromJson(e)).toList();
  }

  @override
  Future<List<OfferModel>> getTraderOffers() async {
    final response = await _client.get(ApiEndpoints.traderOffers);
    final List data = response.data['data'];
    return data.map((e) => OfferModel.fromJson(e)).toList();
  }

  @override
  Future<void> submitOffer(Map<String, dynamic> data) async {
    await _client.post(ApiEndpoints.submitOffer, data: data);
  }

  @override
  Future<void> respondToOffer(String id, String status) async {
    await _client.post("${ApiEndpoints.submitOffer}/$id/respond", data: {'status': status});
  }
}
