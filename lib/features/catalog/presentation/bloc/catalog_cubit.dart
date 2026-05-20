import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/category_model.dart';
import '../../domain/repositories/catalog_repository.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}
class CatalogLoading extends CatalogState {}
class CatalogLoaded extends CatalogState {
  final List<CategoryModel> categories;
  final List<CropModel> crops;
  CatalogLoaded(this.categories, this.crops);
}
class CatalogError extends CatalogState {
  final String message;
  CatalogError(this.message);
}

class CatalogCubit extends Cubit<CatalogState> {
  final CatalogRepository _repository;

  CatalogCubit(this._repository) : super(CatalogInitial());

  Future<void> fetchCatalog() async {
    emit(CatalogLoading());
    final catResult = await _repository.getCategories();
    final cropResult = await _repository.getCrops();

    catResult.fold(
      (failure) => emit(CatalogError(failure.message)),
      (categories) {
        cropResult.fold(
          (failure) => emit(CatalogError(failure.message)),
          (crops) => emit(CatalogLoaded(categories, crops)),
        );
      },
    );
  }
}
