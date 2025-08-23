import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/progress_stepper.dart';
import 'recommendation_class_screen.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ProgressStepper(currentStep: 3, totalSteps: 3),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Riwayat Medis (Opsional)",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  Text("Apakah Anda memiliki alergi obat?",
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  _buildThemedTextField(
                      theme, "Contoh: Paracetamol, Amoxicillin"),
                  const SizedBox(height: 16),
                  Text("Apakah Anda memiliki penyakit kronis/bawaan?",
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  _buildThemedTextField(
                      theme, "Contoh: Asma, Diabetes, Hipertensi"),
                ],
              ),
            ),
          ),
          _buildBottomButton(context, theme),
        ],
      ),
    );
  }

  Widget _buildThemedTextField(ThemeData theme, String hintText) {
    return TextField(
      cursorColor: theme.colorScheme.tertiary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.tertiary, width: 1.5),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context, ThemeData theme) {
    final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
    ).merge(theme.elevatedButtonTheme.style);

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
      color: theme.colorScheme.surface,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecommendationClassScreen()),
            );
          },
          style: customButtonStyle,
          child: const Text("Generate Estimasi"),
        ),
      ),
    );
  }
}
