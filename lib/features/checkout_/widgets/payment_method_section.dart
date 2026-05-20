import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

enum PaymentMethod { card, cash }

class PaymentMethodSection extends StatefulWidget {
  final PaymentMethod selectedMethod;
  final ValueChanged<PaymentMethod> onChanged;

  const PaymentMethodSection({
    super.key,
    required this.selectedMethod,
    required this.onChanged,
  });

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            "payment_method".tr(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            _buildPaymentCard(
              value: PaymentMethod.card,
              title: "credit_card".tr(),
              subtitle: "Visa, Mastercard, etc.",
              icon: Icons.credit_card_outlined,
            ),
            const SizedBox(height: 12),
            _buildPaymentCard(
              value: PaymentMethod.cash,
              title: "cash_on_delivery".tr(),
              subtitle: "Pay when you receive the order",
              icon: Icons.money_outlined,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentCard({
    required PaymentMethod value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = widget.selectedMethod == value;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFF2E7D32) : const Color(0xFFE2E8F0),
          width: isSelected ? 2.0 : 1.5,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFF2E7D32).withOpacity(0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                )
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => widget.onChanged(value),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF2E7D32) : const Color(0xFFF1F5F9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.white : const Color(0xFF64748B),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF334155),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? const Color(0xFF475569) : const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isSelected
                      ? Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E7D32),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, size: 14, color: Colors.white),
                        )
                      : Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFCBD5E1), width: 2),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
