import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/promotion_model.dart';

abstract class PromotionsRepository {
  Future<Either<Failure, List<PromotionModel>>> getMarketingOffers();
}
