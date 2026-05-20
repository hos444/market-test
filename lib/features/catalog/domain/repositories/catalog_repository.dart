import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/category_model.dart';

abstract class CatalogRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<CropModel>>> getCrops();
}
