import 'package:finall_app/model.dart';
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
            'Favourite ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),

      //bottom bar is readyv
     
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
