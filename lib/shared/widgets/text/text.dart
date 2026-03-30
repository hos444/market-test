import 'package:flutter/material.dart';

import '../../export_packeg.dart';

// tsxt to anather page
//change the text to checkout and when click on it go to checkout page

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29.0, right: 29.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          elevation: 6,
          shadowColor: Colors.black45,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Checkout()),
          );
        },
        child: Text(
          'Checkout',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
  