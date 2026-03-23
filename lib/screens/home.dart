import 'package:carousel_slider/carousel_slider.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/screens/search_screen.dart';
import 'package:finall_app/widgets/card_home3.dart';
import 'package:finall_app/widgets/bottom_nav_bar.dart';
import 'package:finall_app/widgets/card_home2.dart';
import 'package:finall_app/widgets/card_home1.dart';
import 'package:flutter/material.dart';

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
  List<FreashModel> freashItem = [
    FreashModel(
      nameCart: 'Honeycrisp Apples',
      imageCart: 'assets/fruits/HonyApple.png',
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
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// النصوص شمال
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 123, 120, 120),
                    ),
                  ),
                  SizedBox(height: 4, width: 9),
                  Text(
                    " everyone",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),

              /// الأيقونات يمين
              Row(children: [_iconCircle(Icons.notifications_none)]),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            //search not ready
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),

              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    /// أيقونة السيرش
                    Icon(Icons.search, color: Colors.grey),

                    SizedBox(width: 10),

                    /// التكست فيلد
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search produce...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    /// زرار الفلتر
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.tune, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'Category ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                    child: const Text(
                      "Viow All",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset('assets/category/fruits.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fruits',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset('assets/category/fruits.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fruits',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset('assets/category/fruits.png'),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fruits',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 5),
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
                      fontSize: 19,
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
                      fontSize: 19,
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
          ], /////
        ),
      ),
      //bottomNigationBar is ready
      //ناقص باقي الصفحات وتتربط بالازرار
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

Widget _iconCircle(IconData icon) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 20, color: Colors.green),
  );
}
