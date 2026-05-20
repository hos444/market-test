import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import '../../orders/presentation/bloc/orders_cubit.dart';
import '../../orders/data/models/order_model.dart';

class Myorder extends StatefulWidget {
  const Myorder({super.key});

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  String _searchQuery = "";
  String _statusFilter = "ALL";
  late String _userRole;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthAuthenticated) {
      _userRole = authState.user.role.toUpperCase();
      context.read<OrdersCubit>().fetchOrders(_userRole);
    } else {
      _userRole = "TRADER"; // Default fallback
    }
  }

  List<OrderModel> _getFilteredOrders(List<OrderModel> orders) {
    return orders.where((order) {
      // Search Logic
      final searchLower = _searchQuery.toLowerCase();
      final matchesSearch = order.id.toLowerCase().contains(searchLower) ||
          (order.orderNumber.toLowerCase().contains(searchLower)); 
          // Note: Frontend also searches item titles, but OrderModel might need careful handling if items is empty
          // We can add title search if we iterate through order.items safely
          
      bool matchesTitle = false;
      if (order.items.isNotEmpty) {
        for (var item in order.items) {
          final title = item.listing?.title;
          if (title != null && title.toLowerCase().contains(searchLower)) {
            matchesTitle = true;
            break;
          }
        }
      }

      // Status Logic
      final matchesStatus = _statusFilter == "ALL" || order.status.toUpperCase() == _statusFilter.toUpperCase();
      
      return (matchesSearch || matchesTitle) && matchesStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isAr = context.locale.languageCode == 'ar';

    // Dynamic Header Text based on Role
    String headerTitle = "orders_management".tr();
    String headerSubtitle = "orders_management_desc".tr();
    
    if (_userRole == "FARMER") {
      headerTitle = "sales_management".tr();
      headerSubtitle = "sales_management_desc".tr();
    } else if (_userRole == "TRADER") {
      headerTitle = "purchase_orders".tr();
      headerSubtitle = "purchase_orders_desc".tr();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF8), // Soft premium background
      appBar: AppBar(
        leading: const ArrowBack(),
        title: Text(
          headerTitle,
          style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF1a1a1a), fontSize: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Subtitle
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Text(
              headerSubtitle,
              style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
            ),
          ),
          
          // Search & Filters
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
            child: Column(
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (val) => setState(() => _searchQuery = val),
                    decoration: InputDecoration(
                      hintText: "search_orders_hint".tr(),
                      hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Filter Chips
                SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFilterChip("ALL", "all".tr()),
                      _buildFilterChip("PENDING_PAYMENT", "pending".tr()),
                      _buildFilterChip("PAID", "paid".tr()),
                      _buildFilterChip("SHIPPED", "shipped".tr()),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Orders List
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersLoading) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: Color(0xFF2E7D32)),
                        const SizedBox(height: 16),
                        Text(
                          "loading_orders".tr(),
                          style: const TextStyle(color: Color(0xFF94A3B8)),
                        ),
                      ],
                    ),
                  );
                }
                if (state is OrdersError) {
                  return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                }
                
                if (state is OrdersLoaded) {
                  final filtered = _getFilteredOrders(state.orders);

                  if (filtered.isEmpty) {
                    return _buildEmptyState(context);
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return OrderCard(order: filtered[index]);
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String status, String label) {
    final isSelected = _statusFilter == status;
    return GestureDetector(
      onTap: () => setState(() => _statusFilter = status),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8, left: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2E7D32).withOpacity(0.05) : Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF2E7D32) : const Color(0xFFE2E8F0),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isSelected ? const Color(0xFF2E7D32) : const Color(0xFF64748B),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shopping_bag_outlined, size: 40, color: Color(0xFFCBD5E1)),
            ),
            const SizedBox(height: 24),
            Text(
              "no_orders".tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 12),
            Text(
              "no_orders_desc".tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainScreen(initialPage: 0)), // Go to Home
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(
                "shop_now".tr(),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
