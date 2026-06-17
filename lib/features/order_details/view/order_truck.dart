import 'package:finall_app/core/theme/app_color.dart';
import 'package:finall_app/core/theme/text.dart';
import 'package:flutter/material.dart';


class OrderTruckScreen extends StatelessWidget {
  const OrderTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        title: Text("Order Truck", style: AppTextStyles.heading),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Truck Type
            _buildDropdown("Truck Type"),

            const SizedBox(height: 16),

            // Pickup Location
            _buildTextField("Pickup Location"),

            const SizedBox(height: 16),

            // Delivery Location
            _buildTextField("Delivery Location"),

            const SizedBox(height: 16),

            // Date
            _buildTextField("Select Date"),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {},
                child: Text("Confirm Order", style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.body,
        filled: true,
        fillColor: AppColors.card,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.border),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(hint, style: AppTextStyles.body),
        items: const [
          DropdownMenuItem(value: "small", child: Text("Small Truck")),
          DropdownMenuItem(value: "medium", child: Text("Medium Truck")),
          DropdownMenuItem(value: "large", child: Text("Large Truck")),
        ],
        onChanged: (value) {},
      ),
    );
  }
}