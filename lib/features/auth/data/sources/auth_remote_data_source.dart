import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> register(Map<String, dynamic> userData);
  Future<void> logout();
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final response = await _client.post(ApiEndpoints.login, data: {
      'email': email,
      'password': password,
    });
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<AuthResponseModel> register(Map<String, dynamic> userData) async {
    final response = await _client.post(ApiEndpoints.register, data: userData);
    return AuthResponseModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await _client.post(ApiEndpoints.logout);
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await _client.get(ApiEndpoints.profile);
    return UserModel.fromJson(response.data['data']);
  }
}
