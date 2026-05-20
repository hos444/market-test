import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../catalog/presentation/bloc/catalog_cubit.dart';
import '../../listings/presentation/bloc/listings_cubit.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late double startPrice;
  late double endPrice;
  String? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    final currentFilters = context.read<ListingsCubit>().currentFilters;
    startPrice = (currentFilters['min_price'] as num?)?.toDouble() ?? 0;
    endPrice = (currentFilters['max_price'] as num?)?.toDouble() ?? 10000;
    selectedCategoryId = currentFilters['category_id']?.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "filter".tr(),
          style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () {
                context.read<ListingsCubit>().resetAllFilters();
                Navigator.pop(context);
              },
              child: Text(
                "reset".tr(),
                style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("categories".tr()),
                const SizedBox(height: 20),
                _buildCategoryList(),
                const SizedBox(height: 40),
                _buildSectionHeader("price_range".tr()),
                const SizedBox(height: 30),
                _buildPriceSlider(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPriceDisplay(startPrice.toInt().toString(), "min"),
                    _buildPriceDisplay(endPrice.toInt().toString(), "max"),
                  ],
                ),
              ],
            ),
          ),
          
          /// 🔹 Apply Button with Gradient
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  elevation: 0,
                ),
                onPressed: () {
                  final filters = {
                    'category_id': selectedCategoryId,
                    'min_price': startPrice > 0 ? startPrice : null,
                    'max_price': endPrice < 10000 ? endPrice : null,
                  };
                  context.read<ListingsCubit>().fetchPublicListings(filters: filters);
                  Navigator.pop(context);
                },
                child: Text(
                  "apply_now".tr(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 6,
        activeTrackColor: Colors.green,
        inactiveTrackColor: Colors.green.withOpacity(0.1),
        thumbColor: Colors.white,
        overlayColor: Colors.green.withOpacity(0.1),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: 12,
          elevation: 5,
        ),
        rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
      ),
      child: RangeSlider(
        values: RangeValues(startPrice, endPrice),
        min: 0,
        max: 10000,
        divisions: 100,
        onChanged: (values) {
          setState(() {
            startPrice = values.start;
            endPrice = values.end;
          });
        },
      ),
    );
  }

  Widget _buildPriceDisplay(String price, String label) {
    return Container(
      width: (MediaQuery.of(context).size.width - 70) / 2,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "EGP",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        if (state is CatalogLoaded) {
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            children: state.categories.map((category) {
              final isSelected = selectedCategoryId == category.id.toString();
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryId = isSelected ? null : category.id.toString();
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.grey.shade200,
                      width: 2,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ]
                        : null,
                  ),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }
        return const Center(child: LinearProgressIndicator(color: Colors.green));
      },
    );
  }
}
