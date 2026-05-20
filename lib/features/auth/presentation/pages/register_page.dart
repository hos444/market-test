import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import '../bloc/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String selectedRole = 'FARMER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register".tr())),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false,
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildRoleSelector(),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "full_name".tr()),
                  validator: (value) => value!.isEmpty ? "required_field".tr() : null,
                ),
                if (selectedRole != 'FARMER')
                  TextFormField(
                    controller: _businessNameController,
                    decoration: InputDecoration(labelText: "business_name".tr()),
                    validator: (value) => value!.isEmpty ? "required_field".tr() : null,
                  ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "email".tr()),
                  validator: (value) => value!.isEmpty ? "required_field".tr() : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "phone".tr()),
                  validator: (value) => value!.isEmpty ? "required_field".tr() : null,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "password".tr()),
                  validator: (value) => value!.length < 8 ? "password_too_short".tr() : null,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "confirm_password".tr()),
                  validator: (value) =>
                      value != _passwordController.text ? "password_mismatch".tr() : null,
                ),
                const SizedBox(height: 30),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is AuthLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                final data = {
                                  'name': _nameController.text,
                                  'email': _emailController.text,
                                  'phone': _phoneController.text,
                                  'password': _passwordController.text,
                                  'password_confirmation': _confirmPasswordController.text,
                                  'account_type': selectedRole,
                                };
                                if (selectedRole != 'FARMER') {
                                  data['business_name'] = _businessNameController.text;
                                }
                                context.read<AuthCubit>().register(data);
                              }
                            },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : Text("register".tr()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _roleButton('FARMER', "farmer".tr()),
        _roleButton('TRADER', "trader".tr()),
        _roleButton('COMPANY', "institution".tr()),
      ],
    );
  }

  Widget _roleButton(String role, String label) {
    final isSelected = selectedRole == role;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) setState(() => selectedRole = role);
      },
    );
  }
}
