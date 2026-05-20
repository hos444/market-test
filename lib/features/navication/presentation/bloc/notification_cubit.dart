import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_client.dart';
import '../../data/models/notification_model.dart';
import 'package:dio/dio.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class NotificationLoading extends NotificationState {}
class NotificationsLoaded extends NotificationState {
  final List<NotificationModel> notifications;
  NotificationsLoaded(this.notifications);
}
class NotificationError extends NotificationState {
  final String message;
  NotificationError(this.message);
}

class NotificationCubit extends Cubit<NotificationState> {
  final ApiClient _client;

  NotificationCubit(this._client) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final response = await _client.get('/notifications');
      final List data = response.data['data']['data'];
      final notifications = data.map((json) => NotificationModel.fromJson(json)).toList();
      emit(NotificationsLoaded(notifications));
    } on DioException catch (e) {
      emit(NotificationError(e.response?.data['message'] ?? "Failed to fetch notifications"));
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await _client.put('/notifications/$id/read');
      fetchNotifications();
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await _client.put('/notifications/read-all');
      fetchNotifications();
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
