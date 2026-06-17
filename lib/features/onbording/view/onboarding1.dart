import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> pages = [
    {
      "image": "assets/onbording/1.png",
      "title": "fresh_vegetables".tr(),
      "desc": "وسع تجارتك بسهولة",
    },
    {
      "image": "assets/onbording/2.png",
      "title": "helsy_food".tr(),
      "desc": "تعاملات آمنة وسريعة",
    },
    {
      "image": "assets/onbording/3.png",
      "title": "start_now".tr(),
      "desc": "ابدأ رحلتك دلوقتي",
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen(initialPage: 0)),
      );
    }
  }

  void skip() {
    _controller.jumpToPage(pages.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// 🔹 Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: skip,
                  child: Text("Farmer_J.skip".tr()),
                ),
              ),

              /// 🔹 Pages
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        /// 🖼️ Image
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(pages[index]["image"]!),
                          ),
                        ),

                        /// 📝 Text
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Text(
                                pages[index]["title"]!,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                pages[index]["desc"]!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),

                              SizedBox(height: 25),

                              /// 🔘 Indicator
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  pages.length,
                                  (i) => AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    width: currentPage == i ? 20 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color:
                                          currentPage == i
                                              ? Colors.green
                                              : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 30),

                              /// 🚀 Button
                              Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF43A047),
                                      Color(0xFF2E7D32),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Text(
                                    index == pages.length - 1
                                        ? "Start_Shopping".tr()
                                        : "Farmer_J.skip".tr(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
