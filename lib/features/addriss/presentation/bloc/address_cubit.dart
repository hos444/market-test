import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/address_model.dart';
import '../../data/repositories/address_repository_impl.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}
class AddressLoading extends AddressState {}
class AddressesLoaded extends AddressState {
  final List<AddressModel> addresses;
  AddressesLoaded(this.addresses);
}
class AddressOperationSuccess extends AddressState {
  final String message;
  AddressOperationSuccess(this.message);
}
class AddressError extends AddressState {
  final String message;
  AddressError(this.message);
}

class AddressCubit extends Cubit<AddressState> {
  final AddressRepository _repository;

  AddressCubit(this._repository) : super(AddressInitial());

  Future<void> fetchAddresses() async {
    emit(AddressLoading());
    final result = await _repository.getAddresses();
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (addresses) => emit(AddressesLoaded(addresses)),
    );
  }

  Future<void> addAddress(Map<String, dynamic> addressData) async {
    emit(AddressLoading());
    final result = await _repository.addAddress(addressData);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (address) {
        emit(AddressOperationSuccess("Address added successfully"));
        fetchAddresses();
      },
    );
  }

  Future<void> updateAddress(String id, Map<String, dynamic> addressData) async {
    emit(AddressLoading());
    final result = await _repository.updateAddress(id, addressData);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (address) {
        emit(AddressOperationSuccess("Address updated successfully"));
        fetchAddresses();
      },
    );
  }

  Future<void> deleteAddress(String id) async {
    emit(AddressLoading());
    final result = await _repository.deleteAddress(id);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (_) {
        emit(AddressOperationSuccess("Address deleted successfully"));
        fetchAddresses();
      },
    );
  }

  Future<void> setDefault(String id) async {
    emit(AddressLoading());
    final result = await _repository.setDefaultAddress(id);
    result.fold(
      (failure) => emit(AddressError(failure.message)),
      (address) {
        emit(AddressOperationSuccess("Default address updated"));
        fetchAddresses();
      },
    );
  }
}
