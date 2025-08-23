import 'package:flutter/material.dart';

class AuthPageLayout extends StatelessWidget {
  final String title;
  final List<Widget> formFields;
  final Widget navigationText;

  const AuthPageLayout({
    super.key,
    required this.title,
    required this.formFields,
    required this.navigationText,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
    ).merge(theme.elevatedButtonTheme.style);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.35,
            child: Center(
              child: Image.asset(
                'assets/images/logo-1.png',
                width: screenSize.width * 0.3,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.tertiary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButtonTheme(
                      data: ElevatedButtonThemeData(style: customButtonStyle),
                      child: Column(children: formFields),
                    ),
                    const SizedBox(height: 24),
                    navigationText,
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
