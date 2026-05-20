import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/promotion_model.dart';
import '../../domain/repositories/promotions_repository.dart';

abstract class PromotionsState {}

class PromotionsInitial extends PromotionsState {}
class PromotionsLoading extends PromotionsState {}
class PromotionsLoaded extends PromotionsState {
  final List<PromotionModel> offers;
  PromotionsLoaded(this.offers);
}
class PromotionsError extends PromotionsState {
  final String message;
  PromotionsError(this.message);
}

class PromotionsCubit extends Cubit<PromotionsState> {
  final PromotionsRepository _repository;

  PromotionsCubit(this._repository) : super(PromotionsInitial());

  Future<void> fetchPromotions() async {
    emit(PromotionsLoading());
    final result = await _repository.getMarketingOffers();
    result.fold(
      (failure) => emit(PromotionsError(failure.message)),
      (offers) => emit(PromotionsLoaded(offers)),
    );
  }
}
