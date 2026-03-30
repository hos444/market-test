import 'package:finall_app/shared/widgets/product_info/card_list_product.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/model.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryHomeModel> cardlist = [
      CategoryHomeModel(name: 'apple', image: 'assets/fruits/apple.png'),
      CategoryHomeModel(name: 'apple', image: 'assets/fruits/apple.png'),
      CategoryHomeModel(name: 'apple', image: 'assets/fruits/apple.png'),
      CategoryHomeModel(name: 'apple', image: 'assets/fruits/apple.png'),
      CategoryHomeModel(name: 'apple', image: 'assets/fruits/apple.png'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product List',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              itemCount: cardlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final item = cardlist[index];
                return CardListProduct(name: item.name, image: item.image);
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
