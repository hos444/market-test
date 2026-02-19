import 'package:carousel_slider/carousel_slider.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/widgets/bottom_nav_bar.dart';
import 'package:finall_app/widgets/card_prodect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  final List<Widget> _pages = [
    Center(child: Text("Home Page")),
    Center(child: Text("Favourite Page")),
    Center(child: Text("Search Page")),
    Center(child: Text("Profile Page")),
    Center(child: Text("Menu Page")),
  ];

  //bannar List
  List<String> item = [
    'assets/bannar/slider1.png',
    'assets/bannar/slider2.png',
    'assets/bannar/slider3.png',
  ];
  List<ItemModel> categoryModel = [
    ItemModel(name: 'Beverages', image: 'assets/category/Beverages.png'),
    ItemModel(name: 'fruits', image: 'assets/category/fruits.png'),
    ItemModel(name: 'Milk & egg', image: 'assets/category/Milk & egg.png'),
    ItemModel(name: 'Vegetable', image: 'assets/category/Vegetable.png'),
    ItemModel(name: 'Laundry', image: 'assets/category/Laundry.png'),
  ];
  List<ProdactModel> carditem = [
    ProdactModel(
      name: 'Banana',
      image: 'assets/fruits/banana.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
    ProdactModel(
      name: 'Orange',
      image: 'assets/fruits/orange.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
    ProdactModel(
      name: 'Limon',
      image: 'assets/fruits/limon.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
    ProdactModel(
      name: 'pepper',
      image: 'assets/fruits/pepper.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
    ProdactModel(
      name: 'Biscuit',
      image: 'assets/fruits/biscuit.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
    ProdactModel(
      name: 'purex',
      image: 'assets/fruits/purex.png',
      price: '\$3.55',
      rate: '4.86',
      ratecont: '300',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar is ready
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motor.svg'),
            SizedBox(width: 10),
            Text('61 Hopper street.', style: TextStyle(fontSize: 19)),
            Icon(Icons.keyboard_arrow_down_rounded, size: 29),
            Spacer(),
            SvgPicture.asset('assets/icons/cort_icon.svg'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //bannar is ready
            CarouselSlider.builder(
              itemCount: item.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image(image: AssetImage(item[itemIndex])),
              options: CarouselOptions(
                height: 170,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 1200),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
              ),
            ),
            //category is ready
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(categoryModel.length, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 27,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset(categoryModel[index].image),
                          ),
                        ),
                      ),
                      Text(
                        categoryModel[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            //see all and fruits text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'Fruits',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Spacer(),
                  Text(
                    'see All',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            // card of prodect
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(carditem.length, (index) {
                    final item = carditem[index];
                    return CardProdect(
                      name: item.name,
                      image: item.image,
                      price: item.price,
                      rate: item.rate,
                      ratecount: item.ratecont,
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      //bottomNigationBar is ready
      //ناقص باقي الصفحات وتتربط بالازرار
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
