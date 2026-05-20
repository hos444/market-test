import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/offer_model.dart';
import '../../domain/repositories/offers_repository.dart';

abstract class OffersState {}

class OffersInitial extends OffersState {}
class OffersLoading extends OffersState {}
class OffersLoaded extends OffersState {
  final List<OfferModel> offers;
  OffersLoaded(this.offers);
}
class OffersError extends OffersState {
  final String message;
  OffersError(this.message);
}

class OffersCubit extends Cubit<OffersState> {
  final OffersRepository _repository;

  OffersCubit(this._repository) : super(OffersInitial());

  Future<void> fetchOffers(String role) async {
    emit(OffersLoading());
    final result = role == 'FARMER'
        ? await _repository.getFarmerOffers()
        : await _repository.getTraderOffers();

    result.fold(
      (failure) => emit(OffersError(failure.message)),
      (offers) => emit(OffersLoaded(offers)),
    );
  }

  Future<void> submitOffer(Map<String, dynamic> data) async {
    emit(OffersLoading());
    final result = await _repository.submitOffer(data);
    result.fold(
      (failure) => emit(OffersError(failure.message)),
      (_) => emit(OffersInitial()),
    );
  }

  Future<void> respondToOffer(String id, String status) async {
    final result = await _repository.respondToOffer(id, status);
    result.fold(
      (failure) => emit(OffersError(failure.message)),
      (_) => fetchOffers('FARMER'), // Re-fetch as farmer after responding
    );
  }
}
