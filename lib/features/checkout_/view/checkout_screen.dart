import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/checkout_cubit.dart';
import '../../addriss/presentation/bloc/address_cubit.dart';
import '../../addriss/data/models/address_model.dart';
import '../widgets/payment_method_section.dart';
import '../widgets/visa_card_widget.dart';
import '../widgets/add_visa_card_form.dart';
import '../../finsh_pay/view/complite_paynow.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.cash;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutProcessing) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CheckoutSuccess) {
          Navigator.pop(context); // close dialog
          context.read<CartController>().clearCart();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => PaynowComplite(orderId: state.orderId)),
          );
        } else if (state is CheckoutError) {
          Navigator.pop(context); // close dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text(
          "checkout".tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => MainScreen(initialPage: 2), // 2 = Cart
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 325.0),
          child: Column(
            children: [
              /// ===== ORDER ITEMS =====
              const CheckoutItemsSection(),

              /// ===== DELIVERY ADDRESS =====
              const SizedBox(height: 16),
              const DeliveryAddressSection(),


              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "delivery_date".tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F5F9), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "delivery_date".tr(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12),

                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0F2F1), // لون خفيف للأيقونة
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                            color: Color(0xFF0B5D4B),
                          ),
                        ),

                        SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "delivery".tr(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${DateFormat('MMM dd, yyyy').format(DateTime.now().add(const Duration(days: 3)))} ${"before_5pm".tr()}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// ===== PAYMENT METHOD =====
              const SizedBox(height: 24),
              PaymentMethodSection(
                selectedMethod: _selectedPaymentMethod,
                onChanged: (method) {
                  setState(() {
                    _selectedPaymentMethod = method;
                  });
                },
              ),

              // Visa Card Visual & Form
              if (_selectedPaymentMethod == PaymentMethod.card) ...[
                const VisaCardWidget(),
                const SizedBox(height: 8),
                const AddVisaCardForm(),
                const SizedBox(height: 24),
              ],

            ],
          ),
        ),
      ),

      bottomSheet: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: BlocBuilder<AddressCubit, AddressState>(
            builder: (context, addressState) {
              return CheckoutBottomSheet(
                onPlaceOrder: () {
                  final cart = context.read<CartController>();
                  if (cart.cartItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("cart_empty".tr())),
                    );
                    return;
                  }

                  AddressModel? selectedAddress;
                  if (addressState is AddressesLoaded && addressState.addresses.isNotEmpty) {
                    selectedAddress = addressState.addresses.firstWhere(
                      (a) => a.isDefault,
                      orElse: () => addressState.addresses.first,
                    );
                  }

                  if (selectedAddress == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("please_select_address".tr()),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  final orderData = {
                    "items": cart.cartItems.map((e) => {
                      "listing_id": e.product.id,
                      "quantity": e.quantity,
                      "unit_price": e.product.price,
                    }).toList(),
                    "total_price": cart.totalAmount,
                    "net_amount": cart.totalAmount,
                    "payment_method": _selectedPaymentMethod == PaymentMethod.card ? "card" : "cash",
                    "shipping_address": selectedAddress.fullAddress,
                    "contact_phone": selectedAddress.receiverPhone ?? "0000000000",
                    "notes": "Order from mobile app"
                  };

                  context.read<CheckoutCubit>().placeOrder(orderData);
                },
              );
            },
          ),
        ),
      ),

    ),
    );
  }
}
