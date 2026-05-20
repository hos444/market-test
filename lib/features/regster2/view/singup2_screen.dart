import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingUp2 extends StatefulWidget {
  final String role;
  const SingUp2({super.key, required this.role});

  @override
  State<SingUp2> createState() => _SingUp2State();
}

class _SingUp2State extends State<SingUp2> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
                (route) => false,
              );
            } else if (state is AuthError) {
              SnackBarUtils.showError(context, state.message);
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black87),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "create_account_title".tr(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xff1A1A1A)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "create_account_desc".tr(),
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 32),
                  
                  _buildTextField(
                    label: "full_name".tr(),
                    hint: "name_hint".tr(),
                    controller: _nameController,
                    icon: Icons.person_outline_rounded,
                    validator: (v) => v!.isEmpty ? "required".tr() : null,
                  ),
                  
                  _buildTextField(
                    label: "business_name".tr(),
                    hint: "business_name_hint".tr(),
                    controller: _businessNameController,
                    icon: Icons.business_center_outlined,
                    validator: (v) => v!.isEmpty ? "required".tr() : null,
                  ),

                  const SizedBox(height: 20),
                  _buildTextField(
                    label: "email".tr(),
                    hint: "email_hint".tr(),
                    controller: _emailController,
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.isEmpty || !v.contains('@') ? "email_invalid".tr() : null,
                  ),

                  const SizedBox(height: 20),
                  _buildTextField(
                    label: "phone".tr(),
                    hint: "phone_hint".tr(),
                    controller: _phoneController,
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (v) => v!.isEmpty ? "required".tr() : null,
                  ),

                  const SizedBox(height: 20),
                  _buildTextField(
                    label: "password".tr(),
                    hint: "password_hint".tr(),
                    controller: _passwordController,
                    icon: Icons.lock_outline_rounded,
                    obscure: _obscurePassword,
                    suffix: IconButton(
                      icon: Icon(_obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye, size: 20),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    validator: (v) => v!.length < 8 ? "password_too_short".tr() : null,
                  ),

                  const SizedBox(height: 20),
                  _buildTextField(
                    label: "confirm_password".tr(),
                    hint: "confirm_password_hint".tr(),
                    controller: _confirmPasswordController,
                    icon: Icons.lock_reset_rounded,
                    obscure: _obscureConfirmPassword,
                    suffix: IconButton(
                      icon: Icon(_obscureConfirmPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye, size: 20),
                      onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                    ),
                    validator: (v) => v != _passwordController.text ? "password_mismatch".tr() : null,
                  ),

                  const SizedBox(height: 40),
                  
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: state is AuthLoading ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1B5E3C),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            elevation: 0,
                          ),
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : Text("register".tr(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already_have_account".tr(), style: TextStyle(color: Colors.grey.shade600)),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login())),
                        child: Text("login_now".tr(), style: const TextStyle(color: Color(0xff1B5E3C), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required IconData icon,
    bool obscure = false,
    Widget? suffix,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff374151))),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          validator: validator,
          cursorColor: const Color(0xFF007AFF),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
            prefixIcon: Icon(icon, color: Colors.grey.shade400, size: 22),
            suffixIcon: suffix,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Color(0xFF007AFF), width: 1.5)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.redAccent)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.redAccent, width: 1.5)),
          ),
        ),
      ],
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'password': _passwordController.text,
        'password_confirmation': _confirmPasswordController.text,
        'account_type': widget.role,
        'business_name': _businessNameController.text,
      };
      context.read<AuthCubit>().register(data);
    }
  }
}
