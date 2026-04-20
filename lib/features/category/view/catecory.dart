import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "category".tr(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      ),
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
