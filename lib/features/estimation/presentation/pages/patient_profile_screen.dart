import 'package:flutter/material.dart';
import 'medical_history_screen.dart';
import '../widgets/custom_dropdown_field.dart';
import '../widgets/custom_input_field.dart';
import '../widgets/progress_stepper.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressStepper(currentStep: 2, totalSteps: 3),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profil Calon Pasien",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
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
                        "Bandung",
                        "Surabaya",
                        "Yogyakarta"
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
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF74B3CE),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Next", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
