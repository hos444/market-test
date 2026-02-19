import 'package:finall_app/model.dart';
import 'package:finall_app/widgets/card_prodect_favourite.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<favouriteModel> carditemFavourite = [
    favouriteModel(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '\$3.55',
    ),
    favouriteModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orange.png',
      priceCart: '\$3.55',
    ),
    favouriteModel(
      nameCart: 'Limon',
      imageCart: 'assets/fruits/limon.png',
      priceCart: '\$3.55',
    ),
    favouriteModel(
      nameCart: 'pepper',
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '\$3.55',
    ),
    favouriteModel(
      nameCart: 'Biscuit',
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '\$3.55',
    ),
    favouriteModel(
      nameCart: 'purex',
      imageCart: 'assets/fruits/purex.png',
      priceCart: '\$3.55',
    ),
  ];
  int _currentIndex = 0;
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
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
