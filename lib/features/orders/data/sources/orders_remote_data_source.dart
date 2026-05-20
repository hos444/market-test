import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getFarmerOrders();
  Future<List<OrderModel>> getTraderOrders();
  Future<List<OrderModel>> getInstitutionOrders();
  Future<void> createOrder(Map<String, dynamic> data);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiClient _client;

  OrdersRemoteDataSourceImpl(this._client);

  @override
  Future<List<OrderModel>> getFarmerOrders() async {
    final response = await _client.get(ApiEndpoints.farmerOrders);
    final List data = response.data['data'];
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<List<OrderModel>> getTraderOrders() async {
    final response = await _client.get(ApiEndpoints.traderOrders);
    final List data = response.data['data'];
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<List<OrderModel>> getInstitutionOrders() async {
    final response = await _client.get(ApiEndpoints.institutionOrders);
    final List data = response.data['data'];
    return data.map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<void> createOrder(Map<String, dynamic> data) async {
    await _client.post(ApiEndpoints.createOrder, data: data);
  }
}
