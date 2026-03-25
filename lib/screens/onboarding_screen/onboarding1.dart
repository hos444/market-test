import 'package:finall_app/screens/export_packeg.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> pages = [
    {"image": "assets/onbording/1.png", "title": "Fresh Vegetables"},
    {"image": "assets/onbording/2.png", "title": "Healthy Food"},
    {"image": "assets/onbording/3.png", "title": "Start Now"},
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
        MaterialPageRoute(builder: (context) => HomePage()),
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
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      onPressed: nextPage,
                      child: Text(
                        index == pages.length - 1 ? "Get Start" : "Next",
                      ),
                    ),

                    TextButton(onPressed: skip, child: Text("Skip")),
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
