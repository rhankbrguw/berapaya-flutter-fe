import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../main_app/presentation/pages/main_screen.dart';
import 'register_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/auth_page_layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    void navigateToMainScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }

    void navigateToRegisterScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    }

    final List<Widget> formFields = [
      const CustomTextField(hintText: "email/username"),
      const SizedBox(height: 16),
      const CustomTextField(hintText: "password", isObscure: true),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: navigateToMainScreen,
          child: const Text("Selanjutnya"),
        ),
      ),
    ];

    final Widget navigationText = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodyMedium,
        children: [
          const TextSpan(text: "Belum punya akun? "),
          TextSpan(
            text: "Daftar Akun",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.tertiary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = navigateToRegisterScreen,
          ),
        ],
      ),
    );

    return AuthPageLayout(
      title: "Login",
      formFields: formFields,
      navigationText: navigationText,
    );
  }
}
