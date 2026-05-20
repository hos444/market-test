import '../../../../core/network/api_client.dart';
import '../models/address_model.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> addAddress(Map<String, dynamic> addressData);
  Future<AddressModel> updateAddress(String id, Map<String, dynamic> addressData);
  Future<void> deleteAddress(String id);
  Future<AddressModel> setDefaultAddress(String id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final ApiClient _client;

  AddressRemoteDataSourceImpl(this._client);

  @override
  Future<List<AddressModel>> getAddresses() async {
    final response = await _client.get('/addresses');
    final List data = response.data['data'];
    return data.map((json) => AddressModel.fromJson(json)).toList();
  }

  @override
  Future<AddressModel> addAddress(Map<String, dynamic> addressData) async {
    final response = await _client.post('/addresses', data: addressData);
    return AddressModel.fromJson(response.data['data']);
  }

  @override
  Future<AddressModel> updateAddress(String id, Map<String, dynamic> addressData) async {
    final response = await _client.put('/addresses/$id', data: addressData);
    return AddressModel.fromJson(response.data['data']);
  }

  @override
  Future<void> deleteAddress(String id) async {
    await _client.delete('/addresses/$id');
  }

  @override
  Future<AddressModel> setDefaultAddress(String id) async {
    final response = await _client.put('/addresses/$id/default');
    return AddressModel.fromJson(response.data['data']);
  }
}
