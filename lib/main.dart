import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/features/cart/widgets/cart_controller.dart';
import 'injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_cubit.dart';
import 'features/catalog/presentation/bloc/catalog_cubit.dart';
import 'features/listings/presentation/bloc/listings_cubit.dart';
import 'features/orders/presentation/bloc/orders_cubit.dart';
import 'features/offers/presentation/bloc/offers_cubit.dart';
import 'features/addriss/presentation/bloc/address_cubit.dart';
import 'features/favorite/presentation/bloc/favorite_cubit.dart';
import 'features/navication/presentation/bloc/notification_cubit.dart';
import 'features/checkout_/presentation/bloc/checkout_cubit.dart';
import 'features/promotions/presentation/bloc/promotions_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
        BlocProvider(create: (_) => di.sl<AuthCubit>()..checkAuthStatus()),
        BlocProvider(create: (_) => di.sl<CatalogCubit>()..fetchCatalog()),
        BlocProvider(create: (_) => di.sl<ListingsCubit>()..fetchPublicListings()),
        BlocProvider(create: (_) => di.sl<OrdersCubit>()),
        BlocProvider(create: (_) => di.sl<OffersCubit>()),
        BlocProvider(create: (_) => di.sl<AddressCubit>()..fetchAddresses()),
        BlocProvider(create: (_) => di.sl<FavoriteCubit>()..fetchFavorites()),
        BlocProvider(create: (_) => di.sl<NotificationCubit>()..fetchNotifications()),
        BlocProvider(create: (_) => di.sl<CheckoutCubit>()),
        BlocProvider(create: (_) => di.sl<PromotionsCubit>()..fetchPromotions()),
      ],
      child: MaterialApp(
        title: 'Washelafas',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            floatingLabelStyle: const TextStyle(color: Color(0xFF007AFF)),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFF007AFF),
            selectionColor: Color(0x33007AFF),
            selectionHandleColor: Color(0xFF007AFF),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFF2E7D32), // Green brand identity
          ),
        ),
        home: const Login(),
      ),
    );
  }
}
