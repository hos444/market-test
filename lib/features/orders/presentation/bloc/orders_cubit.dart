import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/order_model.dart';
import '../../domain/repositories/orders_repository.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}
class OrdersLoading extends OrdersState {}
class OrdersLoaded extends OrdersState {
  final List<OrderModel> orders;
  OrdersLoaded(this.orders);
}
class OrdersError extends OrdersState {
  final String message;
  OrdersError(this.message);
}

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository _repository;

  OrdersCubit(this._repository) : super(OrdersInitial());

  Future<void> fetchOrders(String role) async {
    emit(OrdersLoading());
    final result = role == 'FARMER'
        ? await _repository.getFarmerOrders()
        : role == 'TRADER'
            ? await _repository.getTraderOrders()
            : await _repository.getInstitutionOrders();

    result.fold(
      (failure) => emit(OrdersError(failure.message)),
      (orders) => emit(OrdersLoaded(orders)),
    );
  }

  Future<void> createOrder(Map<String, dynamic> data) async {
    emit(OrdersLoading());
    final result = await _repository.createOrder(data);
    result.fold(
      (failure) => emit(OrdersError(failure.message)),
      (_) => emit(OrdersInitial()), // Or refresh
    );
  }
}
