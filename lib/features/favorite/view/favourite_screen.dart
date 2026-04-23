import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/features/home_screen/models/model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  int currentIndex = 3;

  List<FavouriteModel> carditemFavourite = [
    FavouriteModel(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orang.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'Apple',
      imageCart: 'assets/fruits/apple.png',
      priceCart: '\$3.55',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar is ready
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainScreen(initialPage: 0), // 2 = Cart
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Center(
          child: Text(
            "favourites".tr(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),

      //bottom bar is readyv

      //card prodect ned to upgread to clickapell
      // by add icon favourite
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: carditemFavourite.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, index) {
            final item = carditemFavourite[index];

            return CardFavourite(
              nameFavourite: item.nameCart,
              imageFavourite: item.imageCart,
              priceFavourite: item.priceCart,
            );
          },
        ),
      ),
    );
  }
}
