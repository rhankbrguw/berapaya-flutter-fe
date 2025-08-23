import 'package:flutter/material.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            child: Center(
              child: Image.asset('assets/images/logo-1.png', width: 120),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Akun",
                      style: textTheme.headlineMedium?.copyWith(
                        color: AppColors.accentBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const CustomTextField(hintText: "Nama Lengkap"),
                    const SizedBox(height: 16),
                    const CustomTextField(hintText: "Email/Username"),
                    const SizedBox(height: 16),
                    const CustomTextField(
                        hintText: "Password", isObscure: true),
                    const SizedBox(height: 32),
                    AuthButton(
                      text: "Daftar",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah punya akun? ", style: textTheme.bodyMedium),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.accentBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
