import 'package:flutter/material.dart';

import '../../../../app/core/constants/color_constants.dart';
import '../widgets/progress_stepper.dart';
import '../widgets/service_selection_tile.dart';
import 'patient_profile_screen.dart';

class InputComplaintScreen extends StatefulWidget {
  const InputComplaintScreen({super.key});

  @override
  State<InputComplaintScreen> createState() => _InputComplaintScreenState();
}

class _InputComplaintScreenState extends State<InputComplaintScreen> {
  final List<String> _services = [
    'Konsultasi Dokter Spesialis',
    'Konsultasi Dokter Umum',
    'Laboratorium Dasar',
    'Radiologi',
  ];
  final Set<String> _selectedServices = {};
  int? _diagnosisGroupValue = 2;

  void _toggleService(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ProgressStepper(currentStep: 1, totalSteps: 3),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Keluhan Anda",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Deskripsikan keluhan yang anda rasakan",
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.grey)),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Contoh: Nyeri kepala di bagian belakang",
                      hintStyle: const TextStyle(color: AppColors.grey),
                      filled: true,
                      fillColor: colorScheme.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text("Sudah Punya Diagnosis?",
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Radio<int>(
                        value: 1,
                        groupValue: _diagnosisGroupValue,
                        onChanged: (value) =>
                            setState(() => _diagnosisGroupValue = value),
                      ),
                      const Text("Ya"),
                      const SizedBox(width: 24),
                      Radio<int>(
                        value: 2,
                        groupValue: _diagnosisGroupValue,
                        onChanged: (value) =>
                            setState(() => _diagnosisGroupValue = value),
                      ),
                      const Text("Tidak"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("Layanan Kesehatan",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Pilih layanan kesehatan yang anda inginkan",
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.grey)),
                  const SizedBox(height: 16),
                  for (final service in _services)
                    ServiceSelectionTile(
                      title: service,
                      isSelected: _selectedServices.contains(service),
                      onTap: () => _toggleService(service),
                    ),
                  _buildAddServiceButton(context),
                ],
              ),
            ),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildAddServiceButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Text(
          "Tambah +",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.grey),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      color: Theme.of(context).colorScheme.surface,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PatientProfileScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentBlue,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
