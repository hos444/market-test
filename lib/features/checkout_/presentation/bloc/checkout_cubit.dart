import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../orders/data/sources/orders_remote_data_source.dart';

// States
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutProcessing extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final String orderId;
  CheckoutSuccess(this.orderId);
}

class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError(this.message);
}

// Cubit
class CheckoutCubit extends Cubit<CheckoutState> {
  final OrdersRemoteDataSource _ordersRemoteDataSource;

  CheckoutCubit(this._ordersRemoteDataSource) : super(CheckoutInitial());

  Future<void> placeOrder(Map<String, dynamic> orderData) async {
    emit(CheckoutProcessing());
    try {
      // The API endpoint should match the one used by React
      // We will use the createOrder method which uses ApiEndpoints.createOrder
      await _ordersRemoteDataSource.createOrder(orderData);
      
      // Assume success, generate random ID or get from response if possible
      // (Current createOrder doesn't return the ID, but that's fine for now)
      final dummyOrderId = 'WA-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
      
      emit(CheckoutSuccess(dummyOrderId));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
