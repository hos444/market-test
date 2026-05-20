import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final UserModel user;
  AuthAuthenticated(this.user);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
class AuthUnauthenticated extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  final SharedPreferences _prefs;

  AuthCubit(this._repository, this._prefs) : super(AuthInitial());

  void checkAuthStatus() {
    final userJson = _prefs.getString('user_data');
    final token = _prefs.getString('auth_token');

    if (token != null && userJson != null) {
      final user = UserModel.fromJson(jsonDecode(userJson));
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await _repository.login(email, password);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) async {
        await _prefs.setString('auth_token', response.token);
        await _prefs.setString('user_data', jsonEncode(response.user.toJson()));
        emit(AuthAuthenticated(response.user));
      },
    );
  }

  Future<void> register(Map<String, dynamic> userData) async {
    emit(AuthLoading());
    final result = await _repository.register(userData);

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (response) async {
        await _prefs.setString('auth_token', response.token);
        await _prefs.setString('user_data', jsonEncode(response.user.toJson()));
        emit(AuthAuthenticated(response.user));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoading());
    await _repository.logout();
    await _prefs.remove('auth_token');
    await _prefs.remove('user_data');
    emit(AuthUnauthenticated());
  }
}
