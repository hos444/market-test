import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/order_model.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderModel>>> getFarmerOrders();
  Future<Either<Failure, List<OrderModel>>> getTraderOrders();
  Future<Either<Failure, List<OrderModel>>> getInstitutionOrders();
  Future<Either<Failure, void>> createOrder(Map<String, dynamic> data);
}
