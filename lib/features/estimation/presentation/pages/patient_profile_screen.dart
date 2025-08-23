import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/progress_stepper.dart';
import 'medical_history_screen.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  String? _selectedGender;
  String? _selectedLocation;
  String? _selectedBudget;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: ProgressStepper(currentStep: 2, totalSteps: 3),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Profil Calon Pasien",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  const CustomInputField(
                      label: "Nama", hintText: "Masukkan nama lengkap"),
                  const SizedBox(height: 16),
                  const CustomInputField(
                      label: "Umur",
                      hintText: "Masukkan umur Anda",
                      keyboardType: TextInputType.number),
                  const SizedBox(height: 16),
                  CustomDropdownField(
                    label: "Jenis Kelamin",
                    hint: "Pilih jenis kelamin",
                    value: _selectedGender,
                    items: const ["Laki-laki", "Perempuan"],
                    onChanged: (value) =>
                        setState(() => _selectedGender = value),
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownField(
                    label: "Lokasi saat ini",
                    hint: "Pilih lokasi",
                    value: _selectedLocation,
                    items: const [
                      "Jakarta",
                      "Bogor",
                      "Depok",
                      "Tangerang",
                      "Bekasi"
                    ],
                    onChanged: (value) =>
                        setState(() => _selectedLocation = value),
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownField(
                    label: "Berapa estimasi dana yang Anda siapkan?",
                    hint: "Pilih rentang dana",
                    value: _selectedBudget,
                    items: const [
                      "< 200.000",
                      "< 500.000",
                      "< 1.000.000",
                      "> 1.000.000"
                    ],
                    onChanged: (value) =>
                        setState(() => _selectedBudget = value),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButton(context, theme),
        ],
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
                  builder: (context) => const MedicalHistoryScreen()),
            );
          },
          style: customButtonStyle,
          child: const Text("Selanjutnya"),
        ),
      ),
    );
  }
}
