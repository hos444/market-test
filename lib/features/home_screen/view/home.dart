import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/features/offers/view/offers.dart';
import 'package:finall_app/features/home_screen/models/model.dart';
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
      name: "beverages".tr(),
      image: 'assets/category/Beverages.png',
    ),
    CategoryHomeModel(name: "fruits".tr(), image: 'assets/category/fruits.png'),
    CategoryHomeModel(
      name: "milk_egg".tr(),
      image: 'assets/category/Milk & egg.png',
    ),
    CategoryHomeModel(
      name: "vegetables".tr(),
      image: 'assets/category/Vegetable.png',
    ),
    CategoryHomeModel(
      name: "laundry".tr(),
      image: 'assets/category/Laundry.png',
    ),
  ];
  //flash deals List
  List<FreashModel> freashItem = [
    FreashModel(
      nameCart: "lemon".tr(),
      imageCart: 'assets/fruits/limon.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: "pepper".tr(),
      imageCart: 'assets/fruits/pepper.png',
      priceCart: '100.0',
    ),
    FreashModel(
      nameCart: "biscuit".tr(),
      imageCart: 'assets/fruits/biscuit.png',
      priceCart: '150.0',
    ),
    FreashModel(
      nameCart: "banana".tr(),
      imageCart: 'assets/fruits/banana.png',
      priceCart: '200',
    ),
    FreashModel(
      nameCart: "orange".tr(),
      imageCart: 'assets/fruits/orang.png',
      priceCart: '250',
    ),
    FreashModel(
      nameCart: "strawberry".tr(),
      imageCart: 'assets/fruits/strobary.png',
      priceCart: '200',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      //app bar with search
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
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
                  backgroundImage: AssetImage('assets/logo/homelogo.png'),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('welcome'.tr(), style: AppTextStyles.heading),
                  Text("user_name".tr()),
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
            //search is ready
            // WidgetSerch(),

            //category is ready
            SizedBox(height: 30),
            //bannar is ready
            CarouselSlider.builder(
              itemCount: slideritem.length,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OffersScreen()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(slideritem[itemIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 145,
                viewportFraction: 0.6,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            SizedBox(height: 15),
            // category text and see all
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "category".tr(),
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
                    child: Text(
                      'see_all'.tr(),
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
                    "offers".tr(),
                    style: TextStyle(
                      color: AppColors.warning,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "offerss".tr(),
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
                  Text(
                    "flashdeals".tr(),
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
                      "see_all".tr(),
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

            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(image: AssetImage('assets/bannar/slider4.png')),
            ),
            //recently viewed
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Text(
                    "fruits".tr(),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "see_all".tr(),
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
