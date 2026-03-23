import 'package:finall_app/widgets/card_home2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
          ],
        ),
      ),
    );
  }
}
