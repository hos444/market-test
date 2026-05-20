import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/listing_model.dart';

abstract class ListingsRemoteDataSource {
  Future<List<ListingModel>> getPublicListings({Map<String, dynamic>? filters});
  Future<List<ListingModel>> getFarmerListings();
  Future<void> createListing(Map<String, dynamic> data);
}

class ListingsRemoteDataSourceImpl implements ListingsRemoteDataSource {
  final ApiClient _client;

  ListingsRemoteDataSourceImpl(this._client);

  @override
  Future<List<ListingModel>> getPublicListings({Map<String, dynamic>? filters}) async {
    try {
      final response = await _client.get(ApiEndpoints.publicListings, queryParameters: filters);
      print('Public Listings API Response: ${response.data}');
      final List data = response.data['data'];
      print('DEBUG: Received ${data.length} listings from API');
      return data.map((e) => ListingModel.fromJson(e)).toList();
    } catch (e) {
      print('Public Listings API Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<ListingModel>> getFarmerListings() async {
    final response = await _client.get(ApiEndpoints.farmerListings);
    final List data = response.data['data'];
    return data.map((e) => ListingModel.fromJson(e)).toList();
  }

  @override
  Future<void> createListing(Map<String, dynamic> data) async {
    dynamic body;
    
    if (data['image_file'] != null) {
      final file = data['image_file'] as File;
      data.remove('image_file');
      
      final formData = FormData.fromMap(data);
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      ));
      body = formData;
    } else {
      body = data;
    }

    await _client.post(ApiEndpoints.farmerListings, data: body);
  }
}
