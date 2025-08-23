import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_page_layout.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    void navigateBackToLogin() {
      Navigator.pop(context);
    }

    final List<Widget> formFields = [
      const CustomTextField(hintText: "Nama Lengkap"),
      const SizedBox(height: 16),
      const CustomTextField(hintText: "email/username"),
      const SizedBox(height: 16),
      const CustomTextField(hintText: "password", isObscure: true),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Daftar"),
        ),
      ),
    ];

    final Widget navigationText = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodyMedium,
        children: [
          const TextSpan(text: "Sudah punya akun? "),
          TextSpan(
            text: "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.tertiary,
            ),
            recognizer: TapGestureRecognizer()..onTap = navigateBackToLogin,
          ),
        ],
      ),
    );

    return AuthPageLayout(
      title: "Daftar Akun",
      formFields: formFields,
      navigationText: navigationText,
    );
  }
}
