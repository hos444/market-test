import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../domain/repositories/promotions_repository.dart';
import '../models/promotion_model.dart';

class PromotionsRepositoryImpl implements PromotionsRepository {
  final ApiClient _client;

  PromotionsRepositoryImpl(this._client);

  @override
  Future<Either<Failure, List<PromotionModel>>> getMarketingOffers() async {
    try {
      final response = await _client.get(ApiEndpoints.marketingOffers);
      final List data = response.data['data']['offers'];
      return Right(data.map((e) => PromotionModel.fromJson(e)).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch promotions"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
