import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/listing_model.dart';
import '../../domain/repositories/listings_repository.dart';

abstract class ListingsState {}

class ListingsInitial extends ListingsState {}
class ListingsLoading extends ListingsState {}
class ListingsLoaded extends ListingsState {
  final List<ListingModel> listings;
  ListingsLoaded(this.listings);
}
class ListingsError extends ListingsState {
  final String message;
  ListingsError(this.message);
}

class ListingsCubit extends Cubit<ListingsState> {
  final ListingsRepository _repository;
  Map<String, dynamic> _currentFilters = {};

  ListingsCubit(this._repository) : super(ListingsInitial());

  Map<String, dynamic> get currentFilters => _currentFilters;

  Future<void> fetchPublicListings({Map<String, dynamic>? filters, bool clearFilters = false}) async {
    if (clearFilters) {
      _currentFilters = {};
    } else if (filters != null) {
      _currentFilters.addAll(filters);
      
      // Remove null or empty filters to keep query clean
      _currentFilters.removeWhere((key, value) => value == null || (value is String && value.isEmpty));
    }

    emit(ListingsLoading());
    final result = await _repository.getPublicListings(filters: _currentFilters);
    result.fold(
      (failure) => emit(ListingsError(failure.message)),
      (listings) => emit(ListingsLoaded(listings)),
    );
  }

  void clearSearchFilter() {
    _currentFilters.remove('search');
    fetchPublicListings();
  }

  void resetAllFilters() {
    _currentFilters = {};
    fetchPublicListings();
  }

  Future<void> fetchFarmerListings() async {
    emit(ListingsLoading());
    final result = await _repository.getFarmerListings();
    result.fold(
      (failure) => emit(ListingsError(failure.message)),
      (listings) => emit(ListingsLoaded(listings)),
    );
  }

  Future<void> createListing(Map<String, dynamic> data) async {
    emit(ListingsLoading());
    final result = await _repository.createListing(data);
    result.fold(
      (failure) => emit(ListingsError(failure.message)),
      (_) => fetchFarmerListings(),
    );
  }
}
