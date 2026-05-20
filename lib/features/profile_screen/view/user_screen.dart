import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/botton_logout.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../auth/presentation/bloc/auth_cubit.dart';
import '../../listings/presentation/pages/add_listing_page.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state is AuthAuthenticated ? state.user : null;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainScreen(initialPage: 0)),
                );
              },
            ),
            title: Text(
              "profile".tr(),
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(user),
                const SizedBox(height: 5),
                _buildAccountSettings(user),
                const SizedBox(height: 20),
                _buildLogoutButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(dynamic user) {
    return Container(
      height: 350,
      width: double.infinity,
      child: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
              width: 320,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 228, 228),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user?.name ?? "guest".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    user?.email ?? "guest@example.com",
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                    Text(
                      "${"role".tr()}: ${((user?.role as String?) ?? "guest").toLowerCase().tr()}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/logo/homelogo.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSettings(dynamic user) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              Text(
                "account".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 228, 228),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                if (user?.role == 'FARMER')
                  _buildListTile(
                    'assets/icons/myorder.svg',
                    "manage_listings".tr(),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddListingPage(),
                        ),
                      );
                    },
                  ),
                if (user?.role == 'COMPANY')
                  _buildListTile(
                    'assets/icons/setting.svg',
                    "manage_services".tr(),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ServicesPage(),
                        ),
                      );
                    },
                  ),
                _buildListTile(
                  'assets/icons/myorder.svg',
                  "myOrders.title".tr(),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Myorder()),
                  ),
                ),
                // Negotiations removed
                // Address hidden - _buildListTile('assets/icons/add.svg', "address".tr(), () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdressScreen()))),
                _buildListTile(
                  'assets/icons/notification.svg',
                  "Farmer_J.notifications".tr(),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Natifiation()),
                  ),
                ),
                _buildListTile(
                  'assets/icons/setting.svg',
                  "settings".tr(),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(String iconPath, String title, VoidCallback onTap) {
    return ListTile(
      leading: SvgPicture.asset(iconPath, height: 24, width: 24),
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 228, 228),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/icons/logout.svg',
            height: 24,
            width: 24,
          ),
          title: Text(
            "Farmer_J.logout".tr(),
            style: const TextStyle(color: Colors.red),
          ),
          onTap: () {
            context.read<AuthCubit>().logout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false,
            );
          },
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}
