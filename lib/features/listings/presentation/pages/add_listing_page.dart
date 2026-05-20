import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../bloc/listings_cubit.dart';
import '../../../catalog/presentation/bloc/catalog_cubit.dart';
import '../../../catalog/data/models/category_model.dart';

class AddListingPage extends StatefulWidget {
  const AddListingPage({super.key});

  @override
  State<AddListingPage> createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _qtyController = TextEditingController();
  final _minQtyController = TextEditingController();
  
  String? _selectedCropId;
  String _selectedType = 'SPOT';
  final List<String> _types = ['SPOT', 'PRE_HARVEST', 'AUCTION'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Farmer_J.add_listing".tr(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<ListingsCubit, ListingsState>(
        listener: (context, state) {
          if (state is ListingsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("success".tr()), backgroundColor: Colors.green),
            );
            Navigator.pop(context);
          }
          if (state is ListingsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.redAccent),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImagePicker(),
                const SizedBox(height: 32),
                _buildSectionTitle("Farmer_J.basic_info".tr()),
                const SizedBox(height: 16),
                _buildCropDropdown(),
                const SizedBox(height: 16),
                _buildTextField(
                  label: "title".tr(),
                  hint: "Ex: Fresh Tomatoes Premium",
                  controller: _titleController,
                  validator: (v) => v!.isEmpty ? "required".tr() : null,
                ),
                const SizedBox(height: 16),
                _buildTypeDropdown(),
                const SizedBox(height: 32),
                _buildSectionTitle("Farmer_J.pricing_qty".tr()),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        label: "price".tr(),
                        hint: "0.0",
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        validator: (v) => v!.isEmpty ? "required".tr() : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        label: "quantity".tr(),
                        hint: "0.0",
                        controller: _qtyController,
                        keyboardType: TextInputType.number,
                        validator: (v) => v!.isEmpty ? "required".tr() : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: "min_order_quantity".tr(),
                  hint: "0.0",
                  controller: _minQtyController,
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.isEmpty ? "required".tr() : null,
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: "description".tr(),
                  hint: "Farmer_J.desc_hint".tr(),
                  controller: _descController,
                  maxLines: 4,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1B5E3C),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 0,
                    ),
                    child: Text(
                      "submit".tr(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1A1A1A)),
    );
  }

  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200, width: 2),
        ),
        child: _imageFile != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.file(_imageFile!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined, size: 48, color: Colors.grey.shade400),
                  const SizedBox(height: 12),
                  Text("Farmer_J.add_photo".tr(), style: TextStyle(color: Colors.grey.shade500)),
                ],
              ),
      ),
    );
  }

  Widget _buildCropDropdown() {
    return BlocBuilder<CatalogCubit, CatalogState>(
      builder: (context, state) {
        List<CropModel> crops = [];
        if (state is CatalogLoaded) {
          crops = state.crops;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("crop".tr(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCropId,
              decoration: _inputDecoration("choose_crop".tr()),
              items: crops.map<DropdownMenuItem<String>>((c) => DropdownMenuItem(value: c.id.toString(), child: Text(c.name))).toList(),
              onChanged: (v) => setState(() => _selectedCropId = v),
              validator: (v) => v == null ? "required".tr() : null,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTypeDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("listing_type".tr(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedType,
          decoration: _inputDecoration(""),
          items: _types.map((t) => DropdownMenuItem(value: t, child: Text(t.tr()))).toList(),
          onChanged: (v) => setState(() => _selectedType = v!),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: _inputDecoration(hint),
          validator: validator,
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xff1B5E3C))),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.redAccent)),
    );
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _imageFile = File(picked.path));
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ListingsCubit>().createListing({
        'crop_id': _selectedCropId,
        'type': _selectedType,
        'title': _titleController.text,
        'description': _descController.text,
        'price_per_unit': double.parse(_priceController.text),
        'quantity': double.parse(_qtyController.text),
        'min_order_quantity': double.parse(_minQtyController.text),
        'status': 'PUBLISHED',
        if (_imageFile != null) 'image_file': _imageFile, // Will be handled in repository
      });
    }
  }
}
