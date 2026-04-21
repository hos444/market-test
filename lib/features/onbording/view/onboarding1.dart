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
    {"image": "assets/onbording/3.png", "title": "fresh_vegetables".tr()},
    {"image": "assets/onbording/2.png", "title": "helsy_food".tr()},
    {"image": "assets/onbording/3.png", "title": "start_now".tr()},
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // لما يخلص
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen(initialPage: 0)),
      );
    }
  }

  void skip() {
    _controller.jumpToPage(pages.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  pages[index]["image"]!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pages[index]["title"]!,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 30),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      onPressed: nextPage,
                      child: Text(
                        index == pages.length - 1
                            ? "start_now".tr()
                            : "Farmer_J.next".tr(),
                        style: TextStyle(color: AppColors.background),
                      ),
                    ),

                    TextButton(
                      onPressed: skip,
                      child: Text("Farmer_J.skip".tr()),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
