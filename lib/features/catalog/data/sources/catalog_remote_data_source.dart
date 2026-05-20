import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/category_model.dart';

abstract class CatalogRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CropModel>> getCrops();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  final ApiClient _client;

  CatalogRemoteDataSourceImpl(this._client);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _client.get(ApiEndpoints.categories);
      print('Categories API Response: ${response.data}');
      final List data = response.data['data'];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      print('Categories API Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<CropModel>> getCrops() async {
    final response = await _client.get(ApiEndpoints.crops);
    final List data = response.data['data'];
    return data.map((e) => CropModel.fromJson(e)).toList();
  }
}
