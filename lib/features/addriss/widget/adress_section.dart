import 'package:flutter/material.dart';

import 'adress_details.dart';

class DeliveryAddressSection extends StatefulWidget {
  const DeliveryAddressSection({super.key});

  @override
  State<DeliveryAddressSection> createState() =>
      _DeliveryAddressSectionState();
}

class _DeliveryAddressSectionState
    extends State<DeliveryAddressSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ===== HEADER =====
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xffE8F3FF),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),

                /// title
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Tap to view address",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                /// arrow
                AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
        ),

        /// ===== EXPANDED CONTENT =====
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(),
          secondChild: Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const AddressDetails(),
          ),
        ),
      ],
    );
  }
}