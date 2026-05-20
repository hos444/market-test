import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/offers_repository.dart';
import '../models/offer_model.dart';
import '../sources/offers_remote_data_source.dart';

class OffersRepositoryImpl implements OffersRepository {
  final OffersRemoteDataSource _remoteDataSource;

  OffersRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OfferModel>>> getFarmerOffers() async {
    try {
      final result = await _remoteDataSource.getFarmerOffers();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch offers"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferModel>>> getTraderOffers() async {
    try {
      final result = await _remoteDataSource.getTraderOffers();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch offers"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> submitOffer(Map<String, dynamic> data) async {
    try {
      await _remoteDataSource.submitOffer(data);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to submit offer"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> respondToOffer(String id, String status) async {
    try {
      await _remoteDataSource.respondToOffer(id, status);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to respond to offer"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
