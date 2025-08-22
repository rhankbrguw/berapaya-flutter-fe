import 'package:flutter/material.dart';
import 'patient_profile_screen.dart';
import '../widgets/progress_stepper.dart';
import '../widgets/service_selection_tile.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ProgressStepper(currentStep: 1, totalSteps: 3),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keluhan Anda",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Deskripsikan keluhan yang anda rasakan",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Contoh: Nyeri kepala di bagian belakang",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: Colors.white,
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
                  const Text(
                    "Sudah Punya Diagnosis?",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
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
                  const Text(
                    "Layanan Kesehatan",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Pilih layanan kesehatan yang anda inginkan",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  for (final service in _services) // Fix: Unnecessary toList
                    ServiceSelectionTile(
                      title: service,
                      isSelected: _selectedServices.contains(service),
                      onTap: () => _toggleService(service),
                    ),
                  _buildAddServiceButton(),
                ],
              ),
            ),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildAddServiceButton() {
    return GestureDetector(
      onTap: () {
        // Logika untuk menampilkan dialog tambah layanan
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: const Text(
          "Tambah +",
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.grey.shade50,
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
