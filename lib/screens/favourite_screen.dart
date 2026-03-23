import 'package:finall_app/model.dart';
import 'package:finall_app/widgets/card_favourite.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<FavouriteModel> carditemFavourite = [
    FavouriteModel(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orange.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'Limon',
      imageCart: 'assets/fruits/limon.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'pepper',
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'Biscuit',
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '\$3.55',
    ),
    FavouriteModel(
      nameCart: 'purex',
      imageCart: 'assets/fruits/purex.png',
      priceCart: '\$3.55',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar is ready
      appBar: AppBar(
        title: Center(
          child: Text(
            'Favourite ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      //bottom bar is readyv
      bottomNavigationBar: BottomNavBar(),
      //card prodect ned to upgread to clickapell
      // by add icon favourite
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(carditemFavourite.length, (index) {
              final item = carditemFavourite[index];
              return CardFavourite(
                nameFavourite: item.nameCart,
                imageFavourite: item.imageCart,
                priceFavourite: item.priceCart,
              );
            }),
          ),
        ),
      ),
    );
  }
}
