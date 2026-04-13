import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Text(
                "verify_email".tr(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Text(
                "enter_code_desc".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

              const OtpFields(),

              const SizedBox(height: 40),

              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.green, Color(0xFF66BB6A)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "verify".tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "didnt_receive_code".tr(),
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {},
                child: Text(
                  "resend_code".tr(),
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////

class OtpFields extends StatefulWidget {
  const OtpFields({super.key});

  @override
  State<OtpFields> createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  final controllers = List.generate(4, (_) => TextEditingController());

  final focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  Color getBorder(int index) {
    if (controllers[index].text.isNotEmpty) return Colors.green;
    if (focusNodes[index].hasFocus) return Colors.green;
    return Colors.grey;
  }

  void focusFirstEmpty() {
    for (int i = 0; i < 4; i++) {
      if (controllers[i].text.isEmpty) {
        focusNodes[i].requestFocus();
        return;
      }
    }
  }

  void handleTap(int index) {
    for (int i = 0; i < index; i++) {
      if (controllers[i].text.isEmpty) {
        focusNodes[i].requestFocus();
        return;
      }
    }
  }

  void handleChange(String value, int index) {
    if (value.isNotEmpty) {
      controllers[index].text = value[value.length - 1];

      controllers[index].selection = const TextSelection.collapsed(offset: 1);

      focusFirstEmpty();
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    setState(() {});
  }

  void handleBackspace(int index) {
    if (controllers[index].text.isEmpty && index > 0) {
      controllers[index - 1].clear();
      focusNodes[index - 1].requestFocus();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) {
          return Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: getBorder(index), width: 2),
            ),
            child: RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  handleBackspace(index);
                }
              },
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                textDirection: Directionality.of(context),
                maxLength: 1,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                onTap: () => handleTap(index),
                onChanged: (value) => handleChange(value, index),
              ),
            ),
          );
        }),
      ),
    );
  }
}
