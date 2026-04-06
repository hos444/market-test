import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: ArrowBack(),
        title: const Text("Address", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddressDetails(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedBotton(titel: 'Add Adrees'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
