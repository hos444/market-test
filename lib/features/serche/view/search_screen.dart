import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import 'package:finall_app/core/utils/premium_listing_card.dart';
import '../../listings/presentation/bloc/listings_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {}); // Update UI to show/hide clear icon
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<ListingsCubit>().fetchPublicListings(filters: {'search': query});
      } else {
        context.read<ListingsCubit>().clearSearchFilter();
      }
    });
  }

  void _performSearch() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    final query = _searchController.text;
    if (query.isNotEmpty) {
      context.read<ListingsCubit>().fetchPublicListings(filters: {'search': query});
    } else {
      context.read<ListingsCubit>().clearSearchFilter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search".tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterScreen())),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Reset ALL filters before leaving to ensure Home shows all products
            context.read<ListingsCubit>().resetAllFilters();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainScreen(initialPage: 0)));
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              onSubmitted: (_) => _performSearch(),
              decoration: InputDecoration(
                hintText: "search_hint".tr(),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF007AFF)),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, size: 22, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          context.read<ListingsCubit>().resetAllFilters();
                          setState(() {});
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.search, size: 24, color: Color(0xFF007AFF)),
                        onPressed: _performSearch,
                      ),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ListingsCubit, ListingsState>(
              builder: (context, state) {
                if (state is ListingsLoading) return const Center(child: CircularProgressIndicator());
                if (state is ListingsError) return Center(child: Text(state.message));
                if (state is ListingsLoaded) {
                  if (state.listings.isEmpty) return Center(child: Text("no_results".tr()));
                  return GridView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: state.listings.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.72,
                    ),
                    itemBuilder: (context, index) {
                      return PremiumListingCard(listing: state.listings[index]);
                    },
                  );
                }
                return Center(child: Text("start_searching".tr()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
