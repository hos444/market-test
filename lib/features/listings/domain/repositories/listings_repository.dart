import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/listing_model.dart';

abstract class ListingsRepository {
  Future<Either<Failure, List<ListingModel>>> getPublicListings({Map<String, dynamic>? filters});
  Future<Either<Failure, List<ListingModel>>> getFarmerListings();
  Future<Either<Failure, void>> createListing(Map<String, dynamic> data);
}
