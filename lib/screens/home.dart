import 'package:carousel_slider/carousel_slider.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/screens/natifiation.dart';
import 'package:finall_app/screens/search_screen.dart';
import 'package:finall_app/widgets/home_widgets/card_home3.dart';
import 'package:finall_app/widgets/bottom_nav_bar.dart';
import 'package:finall_app/widgets/home_widgets/card_home2.dart';
import 'package:finall_app/widgets/home_widgets/card_home1.dart';
import 'package:finall_app/widgets/home_widgets/category_home.dart';
import 'package:finall_app/widgets/home_widgets/serch_home_contaner.dart';
import 'package:flutter/material.dart';

import 'filter_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bannar List
  List<String> item = [
    'assets/bannar/slider1.png',
    'assets/bannar/slider2.png',
    'assets/bannar/slider3.png',
    'assets/bannar/slider4.png',
  ];
  //Category List
  List<CategoryHomeModel> categoryModel = [
    CategoryHomeModel(
      name: 'Beverages',
      image: 'assets/category/Beverages.png',
    ),
    CategoryHomeModel(name: 'fruits', image: 'assets/category/fruits.png'),
    CategoryHomeModel(
      name: 'Milk & egg',
      image: 'assets/category/Milk & egg.png',
    ),
    CategoryHomeModel(
      name: 'Vegetable',
      image: 'assets/category/Vegetable.png',
    ),
    CategoryHomeModel(name: 'Laundry', image: 'assets/category/Laundry.png'),
  ];
  //flash deals List
  List<FreashModel> freashItem = [
    FreashModel(
      nameCart: 'Honeycrisp Apples',
      imageCart: 'assets/fruits/HonyApple.png',
      priceCart: '\$200',
    ),
    FreashModel(
      nameCart: 'Srobary',
      imageCart: 'assets/fruits/strobary.png',
      priceCart: '\$200',
    ),
    FreashModel(
      nameCart: 'banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '\$200',
    ),
    FreashModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orang.png',
      priceCart: '\$200',
    ),
    FreashModel(
      nameCart: 'bache',
      imageCart: 'assets/fruits/batche.png',
      priceCart: '\$200',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar with search
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// النصوص شمال
              Text(
                'Wash Alafas',
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 12, 88, 68),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Natifiation(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search is ready
            WidgetSerch(),
            //category text and see all
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'Category ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterScreen()),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //category is ready
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categoryModel.length, (index) {
                  final item = categoryModel[index];
                  return CategoryHome(image: item.image, name: item.name);
                }),
              ),
            ),
            SizedBox(height: 30),
            //bannar is ready
            CarouselSlider.builder(
              itemCount: item.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(image: AssetImage(item[itemIndex])),
                      ),
              options: CarouselOptions(
                height: 160,
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
            SizedBox(height: 15),
            //flash deals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'Flash deals',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            // card of flash deals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(freashItem.length, (index) {
                  final item = freashItem[index];
                  return CardHome1(
                    namecard: item.nameCart,
                    imagecard: item.imageCart,
                    pricecard: item.priceCart,
                  );
                }),
              ),
            ),
            SizedBox(height: 5),
            //new arrivals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'New arrivals',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            //card of new arrivals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Cardhome2(),
                    SizedBox(width: 16),
                    Cardhome2(),
                    SizedBox(width: 16),
                    Cardhome2(),
                    SizedBox(width: 16),
                    Cardhome2(),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            //recently viewed
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    'Recently Viewed',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
            //card of recently viewed
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardHOme3(),
                    SizedBox(width: 16),
                    CardHOme3(),
                    SizedBox(width: 16),
                    CardHOme3(),
                    SizedBox(width: 16),
                    CardHOme3(),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      //bottomNigationBar is ready
      bottomNavigationBar: HomeLayout(),
    );
  }
}
