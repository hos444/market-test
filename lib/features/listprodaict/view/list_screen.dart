import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/image_url_utils.dart';
import '../../listings/presentation/bloc/listings_cubit.dart';
import 'package:finall_app/injection_container.dart' as di;

class ListProductScreen extends StatelessWidget {
  final String? categoryId;
  final String? categoryName;

  const ListProductScreen({super.key, this.categoryId, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<ListingsCubit>()..fetchPublicListings(
        filters: categoryId != null ? {'category_id': categoryId} : null,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            categoryName ?? 'product_list'.tr(),
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ListingsCubit, ListingsState>(
          builder: (context, state) {
            if (state is ListingsLoading) return const Center(child: CircularProgressIndicator());
            if (state is ListingsError) return Center(child: Text(state.message));
            if (state is ListingsLoaded) {
              if (state.listings.isEmpty) return Center(child: Text("no_products".tr()));
              return GridView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: state.listings.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return PremiumListingCard(listing: state.listings[index]);
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
