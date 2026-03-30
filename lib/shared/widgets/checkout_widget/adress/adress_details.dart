import 'package:flutter/material.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// name + edit
        Row(
          children: [
            const Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text("Edit"),
            ),
          ],
        ),

        const SizedBox(height: 8),

        const Text(
          "Hossam Mostafa",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),

        const SizedBox(height: 4),

        const Text(
          "Al Manyal, Cairo, Egypt\nStreet 12, Building 5, Apartment 10",
          style: TextStyle(
            color: Colors.black54,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 8),

        Row(
          children: const [
            Icon(Icons.phone, size: 16, color: Colors.grey),
            SizedBox(width: 6),
            Text("+20 114 411 2445"),
          ],
        ),
      ],
    );
  }
}