import 'package:finall_app/features/offers/widget/cart_offers.dart';
import 'package:finall_app/features/home_screen/models/model.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Offers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFE8F5E9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFF66BB6A), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "قشر وكل ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "احصل على خصم 30% على افضل الفواكة! .",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Text(
                    "استفد من هذا العرض الحصري \nلتجديد مخزونك بأفضل الفواكة الطازجة!",
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF2E7D32),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "خصم 30%",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),
                      Text(
                        "العرض ساري حتى 30 سبتمبر",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                itemCount: carditemFavourite.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.90,
                ),
                itemBuilder: (context, index) {
                  final item = carditemFavourite[index];

                  return CartOffers(
                    nameFavourite: item.nameCart,
                    imageFavourite: item.imageCart,
                    priceFavourite: item.priceCart,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
