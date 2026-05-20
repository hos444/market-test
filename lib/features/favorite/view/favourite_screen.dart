import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/favorite_cubit.dart';
import '../widget/card_favourite.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const MainScreen(initialPage: 0),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Center(
          child: Text(
            "favourites".tr(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteError) {
            return Center(child: Text(state.message));
          } else if (state is FavoritesLoaded) {
            if (state.listings.isEmpty) {
              return Center(child: Text("no_favorites".tr()));
            }
            return Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: state.listings.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final listing = state.listings[index];
                  return CardFavourite(listing: listing);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
