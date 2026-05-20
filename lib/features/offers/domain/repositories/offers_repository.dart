import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/offer_model.dart';

abstract class OffersRepository {
  Future<Either<Failure, List<OfferModel>>> getFarmerOffers();
  Future<Either<Failure, List<OfferModel>>> getTraderOffers();
  Future<Either<Failure, void>> submitOffer(Map<String, dynamic> data);
  Future<Either<Failure, void>> respondToOffer(String id, String status);
}
