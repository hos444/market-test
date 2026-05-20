import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/features/cart/widgets/cart_controller.dart';

class MainScreen extends StatefulWidget {
  final int initialPage;

  const MainScreen({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _page;
  
  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    // Define screens inside build to ensure they react to context changes (like Locale)
    // Removing 'const' to ensure fresh instances that react to context/locale changes
    final List<Widget> traderScreens = [
      HomePage(),
      Favourite(),
      CartScreen(),
      Myorder(),
      UserScreen(),
    ];

    final List<Widget> farmerScreens = [
      FarmerDashboardPage(),
      OffersPage(),
      UserScreen(),
    ];

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state is AuthAuthenticated ? state.user : null;
        final role = user?.role ?? 'TRADER';
        final isFarmer = role == 'FARMER';
        
        final List<Widget> screens = isFarmer ? farmerScreens : traderScreens;

        // Define icons based on role
        final cartCount = context.watch<CartController>().cartItems.length;
        final List<Widget> navItems = isFarmer
            ? const [
                Icon(Icons.dashboard_customize_outlined, color: Colors.white, size: 24),
                Icon(Icons.handshake_outlined, color: Colors.white, size: 24),
                Icon(Icons.person_outline_rounded, color: Colors.white, size: 24),
              ]
            : [
                const Icon(Icons.home_outlined, color: Colors.white, size: 24),
                const Icon(Icons.favorite_outline_rounded, color: Colors.white, size: 24),
                Badge.count(
                  count: cartCount,
                  isLabelVisible: cartCount > 0,
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 24),
                ),
                const Icon(Icons.list_alt_rounded, color: Colors.white, size: 24),
                const Icon(Icons.person_outline_rounded, color: Colors.white, size: 24),
              ];

        if (_page >= screens.length) {
          _page = 0;
        }

        return PopScope(
          canPop: _page == 0,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            setState(() {
              _page = 0;
            });
          },
          child: Scaffold(
            key: ValueKey(context.locale.toString()), // Force rebuild on locale change
            body: IndexedStack(index: _page, children: screens),
            bottomNavigationBar: CurvedNavigationBar(
              index: _page,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: const Color(0xff1B5E3C),
              color: const Color(0xff1B5E3C),
              animationDuration: const Duration(milliseconds: 300),
              items: navItems,
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
