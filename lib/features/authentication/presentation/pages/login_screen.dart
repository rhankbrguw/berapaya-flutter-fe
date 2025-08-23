import 'package:flutter/material.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../../../main_app/presentation/pages/main_screen.dart';
import 'register_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Center(
              child: Image.asset('assets/images/logo-1.png', width: 150),
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
                      "Login",
                      style: textTheme.headlineMedium?.copyWith(
                        color: AppColors.accentBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const CustomTextField(hintText: "Email/Username"),
                    const SizedBox(height: 16),
                    const CustomTextField(
                        hintText: "Password", isObscure: true),
                    const SizedBox(height: 32),
                    AuthButton(
                      text: "Selanjutnya",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun? ", style: textTheme.bodyMedium),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Text(
                            "Daftar Akun",
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
