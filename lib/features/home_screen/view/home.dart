import 'package:carousel_slider/carousel_slider.dart';
import 'package:finall_app/model.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  //bannar List
  List<String> slideritem = [
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
      nameCart: 'Limon',
      imageCart: 'assets/fruits/limon.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'pepper',
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: 'Biscuit',
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '150.0',
    ),
    FreashModel(
      nameCart: 'Banana',
      imageCart: 'assets/fruits/banana.png',
      priceCart: '200',
    ),
    FreashModel(
      nameCart: 'Orange',
      imageCart: 'assets/fruits/orang.png',
      priceCart: '250',
    ),
    FreashModel(
      nameCart: 'Srobary',
      imageCart: 'assets/fruits/strobary.png',
      priceCart: '200',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //app bar with search
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            children: [
              /// النصوص شمال
              Container(
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage('assets/logo/Image.png'),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('HELLO,', style: AppTextStyles.heading),
                  Text('User name'),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border, width: 1),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.notifications, color: Colors.green),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Natifiation()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            //search is ready
            // WidgetSerch(),

            //category is ready
            SizedBox(height: 30),
            //bannar is ready
            CarouselSlider.builder(
              itemCount: slideritem.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(image: AssetImage(slideritem[itemIndex])),
                      ),
              options: CarouselOptions(
                height: 145,

                viewportFraction: 0.6,
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
            // category text and see all
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    'Category ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // category list
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categoryModel.length, (index) {
                  final item = categoryModel[index];
                  return CategoryHome(image: item.image, name: item.name);
                }),
              ),
            ),
            SizedBox(height: 15),
            //column of exclusive offers and today's best deals
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Exclusive offers',
                    style: TextStyle(
                      color: AppColors.warning,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Today's best deals",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            // card home1 best deals
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
            const SizedBox(height: 5),
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(image: AssetImage('assets/bannar/slider1.png')),
            ),
            SizedBox(height: 5),
            // text of new falash deals and see all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  const Text(
                    'Flash Deals',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            //card of new arrivals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(freashItem.length, (index) {
                  final item = freashItem[index];
                  return Cardhome2(
                    name: item.nameCart,
                    image: item.imageCart,
                    price: item.priceCart,
                  );
                }),
              ),
            ),
            SizedBox(height: 5),
            // text of new falash deals and see all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  const Text(
                    'Featured Products',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(image: AssetImage('assets/bannar/slider4.png')),
            ),
            //recently viewed
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const Row(
                children: [
                  Text(
                    'Recently Viewed',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),

            //card of recently viewed //card of new arrivals
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(freashItem.length, (index) {
                  final item = freashItem[index];
                  return Cardhome2(
                    name: item.nameCart,
                    image: item.imageCart,
                    price: item.priceCart,
                  );
                }),
              ),
            ),
          ],
        ),
      ),

      //bottomNigationBar is ready
    );
  }
}
