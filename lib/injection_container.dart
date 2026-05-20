import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/api_client.dart';

// Auth
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_remote_data_source.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_cubit.dart';

// Catalog
import 'features/catalog/data/repositories/catalog_repository_impl.dart';
import 'features/catalog/data/sources/catalog_remote_data_source.dart';
import 'features/catalog/domain/repositories/catalog_repository.dart';
import 'features/catalog/presentation/bloc/catalog_cubit.dart';

// Listings
import 'features/listings/data/repositories/listings_repository_impl.dart';
import 'features/listings/data/sources/listings_remote_data_source.dart';
import 'features/listings/domain/repositories/listings_repository.dart';
import 'features/listings/presentation/bloc/listings_cubit.dart';

// Orders
import 'features/orders/data/repositories/orders_repository_impl.dart';
import 'features/orders/data/sources/orders_remote_data_source.dart';
import 'features/orders/domain/repositories/orders_repository.dart';
import 'features/orders/presentation/bloc/orders_cubit.dart';

// Offers
import 'features/offers/data/repositories/offers_repository_impl.dart';
import 'features/offers/data/sources/offers_remote_data_source.dart';
import 'features/offers/domain/repositories/offers_repository.dart';
import 'features/offers/presentation/bloc/offers_cubit.dart';

// Address
import 'features/addriss/data/repositories/address_repository_impl.dart';
import 'features/addriss/data/sources/address_remote_data_source.dart';
import 'features/addriss/presentation/bloc/address_cubit.dart';

import 'features/favorite/presentation/bloc/favorite_cubit.dart';

import 'features/navication/presentation/bloc/notification_cubit.dart';

import 'features/checkout_/presentation/bloc/checkout_cubit.dart';
import 'features/promotions/data/repositories/promotions_repository_impl.dart';
import 'features/promotions/domain/repositories/promotions_repository.dart';
import 'features/promotions/presentation/bloc/promotions_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Auth
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));

  // Features - Catalog
  sl.registerFactory(() => CatalogCubit(sl()));
  sl.registerLazySingleton<CatalogRepository>(() => CatalogRepositoryImpl(sl()));
  sl.registerLazySingleton<CatalogRemoteDataSource>(() => CatalogRemoteDataSourceImpl(sl()));

  // Features - Listings
  sl.registerFactory(() => ListingsCubit(sl()));
  sl.registerLazySingleton<ListingsRepository>(() => ListingsRepositoryImpl(sl()));
  sl.registerLazySingleton<ListingsRemoteDataSource>(() => ListingsRemoteDataSourceImpl(sl()));

  // Features - Orders
  sl.registerFactory(() => OrdersCubit(sl()));
  sl.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(sl()));
  sl.registerLazySingleton<OrdersRemoteDataSource>(() => OrdersRemoteDataSourceImpl(sl()));

  // Features - Offers
  sl.registerFactory(() => OffersCubit(sl()));
  sl.registerLazySingleton<OffersRepository>(() => OffersRepositoryImpl(sl()));
  sl.registerLazySingleton<OffersRemoteDataSource>(() => OffersRemoteDataSourceImpl(sl()));

  // Features - Address
  sl.registerFactory(() => AddressCubit(sl()));
  sl.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl(sl()));
  sl.registerLazySingleton<AddressRemoteDataSource>(() => AddressRemoteDataSourceImpl(sl()));

  sl.registerFactory(() => FavoriteCubit(sl()));

  sl.registerFactory(() => NotificationCubit(sl()));

  // Checkout
  sl.registerFactory(() => CheckoutCubit(sl()));

  // Promotions
  sl.registerFactory(() => PromotionsCubit(sl()));
  sl.registerLazySingleton<PromotionsRepository>(() => PromotionsRepositoryImpl(sl()));

  // Core
  sl.registerLazySingleton(() => ApiClient(sl(), sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
}
