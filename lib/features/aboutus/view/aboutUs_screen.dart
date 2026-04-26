import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/features/aboutus/widget/widgets.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("about_us".tr()),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -------- SECTION 1 ----------
            PolicySection(
              title: "1. Agreement of terms",
              content:
                  "Duis tristique diam nunc. Sed at tincidunt orci. "
                  "Mauris eget congue leo. Cras varius at ante vitae convallis. "
                  "Duis semper magna nec tortor tincidunt, id tincidunt quam blandit. "
                  "Vivamus vehicula dictum magna quis eleifend.",
            ),

            SizedBox(height: 24),

            /// -------- SECTION 2 ----------
            PolicySection(
              title: "2. Terms of services",
              content:
                  "Simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  "It has survived not only five centuries, but also the leap into electronic typesetting, "
                  "remaining essentially unchanged.",
            ),

            SizedBox(height: 24),

            /// -------- SECTION 3 ----------
            PolicySection(
              title: "3. Condition of use",
              content:
                  "Sed sollicitudin nisi mollis libero consectetur rutrum. "
                  "Nam maximus mollis nisl quis facilisis. Integer fermentum commodo nibh. "
                  "Ut mollis tincidunt hendrerit. Duis ipsum velit, maximus sed commodo imperdiet, "
                  "dapibus id velit. Nullam in maximus enim.",
            ),
          ],
        ),
      ),
    );
  }
}


