import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF74B3CE),
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
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Belum punya akun? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: const Text(
                            "Daftar Akun",
                            style: TextStyle(
                              color: Color(0xFF74B3CE),
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
