import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../models/address_model.dart';
import '../sources/address_remote_data_source.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressModel>>> getAddresses();
  Future<Either<Failure, AddressModel>> addAddress(Map<String, dynamic> addressData);
  Future<Either<Failure, AddressModel>> updateAddress(String id, Map<String, dynamic> addressData);
  Future<Either<Failure, void>> deleteAddress(String id);
  Future<Either<Failure, AddressModel>> setDefaultAddress(String id);
}

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  AddressRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses() async {
    try {
      final result = await _remoteDataSource.getAddresses();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch addresses"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> addAddress(Map<String, dynamic> addressData) async {
    try {
      final result = await _remoteDataSource.addAddress(addressData);
      return Right(result);
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "Failed to add address";
      if (e.response?.data['errors'] != null) {
        final errors = e.response?.data['errors'] as Map<String, dynamic>;
        message = errors.values.first.first.toString();
      }
      return Left(ServerFailure(message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> updateAddress(String id, Map<String, dynamic> addressData) async {
    try {
      final result = await _remoteDataSource.updateAddress(id, addressData);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to update address"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String id) async {
    try {
      await _remoteDataSource.deleteAddress(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to delete address"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> setDefaultAddress(String id) async {
    try {
      final result = await _remoteDataSource.setDefaultAddress(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to set default address"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
