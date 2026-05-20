import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/api_client.dart';
import '../../../listings/data/models/listing_model.dart';
import 'package:dio/dio.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class FavoriteLoading extends FavoriteState {}
class FavoritesLoaded extends FavoriteState {
  final List<ListingModel> listings;
  FavoritesLoaded(this.listings);
}
class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}

class FavoriteCubit extends Cubit<FavoriteState> {
  final ApiClient _client;

  FavoriteCubit(this._client) : super(FavoriteInitial());

  Future<void> fetchFavorites() async {
    emit(FavoriteLoading());
    try {
      final response = await _client.get('/favorites');
      final List data = response.data['data'];
      final listings = data.map((item) => ListingModel.fromJson(item['listing'])).toList();
      emit(FavoritesLoaded(listings));
    } on DioException catch (e) {
      emit(FavoriteError(e.response?.data['message'] ?? "Failed to fetch favorites"));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> toggleFavorite(String listingId) async {
    try {
      await _client.post('/favorites/toggle', data: {'listing_id': listingId});
      fetchFavorites();
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
