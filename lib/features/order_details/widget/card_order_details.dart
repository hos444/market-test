import 'package:flutter/material.dart';
import '../model/card_model.dart';

class PrescriptionCard extends StatelessWidget {
  final PrescriptionModel model;

  const PrescriptionCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Icon(Icons.local_hospital),
          ),

          const SizedBox(width: 12),

          /// DATA
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${model.name}"),
                const SizedBox(height: 6),
                Text("ID: ${model.id}"),
                const SizedBox(height: 6),
                Text("Date: ${model.date}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}