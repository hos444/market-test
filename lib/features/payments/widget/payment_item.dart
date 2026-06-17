import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SvgPicture.asset('assets/payments/master.svg'),
          ),

          const SizedBox(width: 12),

          /// info
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Master Card",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "**** **** **** 1234",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          /// quantity buttons
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddNewCredit()),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Color.fromARGB(255, 83, 164, 58),
            ),
          ),
        ],
      ),
    );
  }
}
