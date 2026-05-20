import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AuthResponseModel>> login(String email, String password) async {
    try {
      final result = await _remoteDataSource.login(email, password);
      return Right(result);
    } on DioException catch (e) {
      String message = e.response?.data['message'] ?? "Login failed";
      if (e.response?.data['errors'] != null) {
        final errors = e.response?.data['errors'] as Map<String, dynamic>;
        final firstError = errors.values.first;
        if (firstError is List && firstError.isNotEmpty) {
          message = firstError.first.toString();
        }
      }
      return Left(ServerFailure(message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> register(Map<String, dynamic> userData) async {
    try {
      final result = await _remoteDataSource.register(userData);
      return Right(result);
    } on DioException catch (e) {
      final responseData = e.response?.data;
      print('Registration Error Response: $responseData');
      
      String message = "Registration failed";
      if (responseData != null && responseData is Map) {
        message = responseData['message'] ?? "Registration failed";
        if (responseData['errors'] != null) {
          final errors = responseData['errors'] as Map<String, dynamic>;
          if (errors.isNotEmpty) {
            final firstError = errors.values.first;
            if (firstError is List && firstError.isNotEmpty) {
              message = firstError.first.toString();
            }
          }
        }
      } else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
        message = "Connection timeout. Please check your internet.";
      } else if (e.response == null) {
        message = "Network error. Server might be down or unreachable.";
      }
      
      return Left(ServerFailure(message));
    } catch (e) {
      print('Registration Catch Error: $e');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final result = await _remoteDataSource.getProfile();
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response?.data['message'] ?? "Failed to fetch profile"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
