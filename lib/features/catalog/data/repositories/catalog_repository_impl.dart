import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/catalog_repository.dart';
import '../models/category_model.dart';
import '../sources/catalog_remote_data_source.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  final CatalogRemoteDataSource _remoteDataSource;

  CatalogRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final result = await _remoteDataSource.getCategories();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch categories"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CropModel>>> getCrops() async {
    try {
      final result = await _remoteDataSource.getCrops();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch crops"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
