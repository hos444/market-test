import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/listings_repository.dart';
import '../models/listing_model.dart';
import '../sources/listings_remote_data_source.dart';

class ListingsRepositoryImpl implements ListingsRepository {
  final ListingsRemoteDataSource _remoteDataSource;

  ListingsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<ListingModel>>> getPublicListings({Map<String, dynamic>? filters}) async {
    try {
      final result = await _remoteDataSource.getPublicListings(filters: filters);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch listings"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ListingModel>>> getFarmerListings() async {
    try {
      final result = await _remoteDataSource.getFarmerListings();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch your listings"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createListing(Map<String, dynamic> data) async {
    try {
      await _remoteDataSource.createListing(data);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to create listing"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
