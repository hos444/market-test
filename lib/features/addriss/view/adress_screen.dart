import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/address_cubit.dart';
import '../data/models/address_model.dart';

class AdressScreen extends StatefulWidget {
  const AdressScreen({super.key});

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AdressScreen> {
  final _nameController = TextEditingController();
  final _governorateController = TextEditingController();
  final _cityController = TextEditingController();
  final _districtController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _floorController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _receiverNameController = TextEditingController();
  final _receiverPhoneController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _governorateController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _floorController.dispose();
    _apartmentController.dispose();
    _receiverNameController.dispose();
    _receiverPhoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    final data = {
      'name': _nameController.text,
      'governorate': _governorateController.text,
      'city': _cityController.text,
      'district': _districtController.text,
      'street': _streetController.text,
      'building': _buildingController.text,
      'floor': _floorController.text,
      'apartment': _apartmentController.text,
      'receiver_name': _receiverNameController.text,
      'receiver_phone': _receiverPhoneController.text,
      'notes': _notesController.text,
    };

    if (data['name']!.isEmpty || data['governorate']!.isEmpty || data['city']!.isEmpty || data['street']!.isEmpty || data['receiver_name']!.isEmpty || data['receiver_phone']!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("fill_all_fields".tr())),
      );
      return;
    }

    context.read<AddressCubit>().addAddress(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBack(),
        title: Text("address".tr()),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: BlocListener<AddressCubit, AddressState>(
        listener: (context, state) {
          if (state is AddressOperationSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context);
          } else if (state is AddressError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🗺️ Container بديل مؤقت للخريطة
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey[300],
                      child: Center(child: Text("map_placeholder".tr())),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () {},
                        child: Text("add_current_location".tr()),
                      ),
                    ),
                  ],
                ),
              ),

              /// 📋 FORM
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("shipping_address".tr()),
                    _buildTextField(_nameController, "address_name".tr()),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(_governorateController, "governorate".tr())),
                        const SizedBox(width: 8),
                        Expanded(child: _buildTextField(_cityController, "city".tr())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(_districtController, "district".tr())),
                        const SizedBox(width: 8),
                        Expanded(child: _buildTextField(_streetController, "street_name".tr())),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(_buildingController, "building".tr())),
                        const SizedBox(width: 8),
                        Expanded(child: _buildTextField(_floorController, "floor".tr())),
                        const SizedBox(width: 8),
                        Expanded(child: _buildTextField(_apartmentController, "apartment".tr())),
                      ],
                    ),

                    sectionTitle("receiver_contact".tr()),
                    _buildTextField(_receiverNameController, "receiver_name".tr()),
                    _buildTextField(_receiverPhoneController, "mobile_number".tr()),
                    _buildTextField(_notesController, "driver_notes".tr()),

                    const SizedBox(height: 20),

                    BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: state is AddressLoading ? null : _saveAddress,
                            child: state is AddressLoading 
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text("save_location".tr()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
