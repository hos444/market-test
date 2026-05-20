import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/address_cubit.dart';
import '../data/models/address_model.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        AddressModel? defaultAddress;
        if (state is AddressesLoaded) {
          if (state.addresses.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Text("no_addresses_found".tr()),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdressScreen()),
                      );
                    },
                    child: Text("add_new_address".tr()),
                  ),
                ],
              ),
            );
          }
          // Get default or first address
          defaultAddress = state.addresses.firstWhere(
            (AddressModel a) => a.isDefault,
            orElse: () => state.addresses.first,
          );
        }

        if (defaultAddress == null) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// name + edit
            Row(
              children: [
                Text(
                  defaultAddress.name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AdressScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 83, 164, 58),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              defaultAddress.receiverName ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 4),

            Text(
              "${defaultAddress.street}, ${defaultAddress.city}, ${defaultAddress.governorate}\n"
              "${defaultAddress.building != null ? "Building ${defaultAddress.building}, " : ""}"
              "${defaultAddress.floor != null ? "Floor ${defaultAddress.floor}, " : ""}"
              "${defaultAddress.apartment != null ? "Apartment ${defaultAddress.apartment}" : ""}",
              style: const TextStyle(color: Colors.black54, height: 1.4),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.phone, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                Text(defaultAddress.receiverPhone ?? ""),
              ],
            ),
          ],
        );
      },
    );
  }
}
