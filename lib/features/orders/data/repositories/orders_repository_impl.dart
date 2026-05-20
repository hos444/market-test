import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/orders_repository.dart';
import '../models/order_model.dart';
import '../sources/orders_remote_data_source.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource _remoteDataSource;

  OrdersRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getFarmerOrders() async {
    try {
      final result = await _remoteDataSource.getFarmerOrders();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch orders"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getTraderOrders() async {
    try {
      final result = await _remoteDataSource.getTraderOrders();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch orders"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getInstitutionOrders() async {
    try {
      final result = await _remoteDataSource.getInstitutionOrders();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch orders"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createOrder(Map<String, dynamic> data) async {
    try {
      await _remoteDataSource.createOrder(data);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to create order"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
