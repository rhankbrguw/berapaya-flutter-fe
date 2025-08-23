import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/progress_stepper.dart';
import '../widgets/service_selection_tile.dart';
import 'patient_profile_screen.dart';

class InputComplaintScreen extends StatefulWidget {
  const InputComplaintScreen({super.key});

  @override
  State<InputComplaintScreen> createState() => _InputComplaintScreenState();
}

class _InputComplaintScreenState extends State<InputComplaintScreen> {
  final _addServiceController = TextEditingController();

  final List<String> _services = [
    'Konsultasi Dokter Spesialis',
    'Konsultasi Dokter Umum',
    'Laboratorium Dasar',
    'Radiologi',
  ];
  final Set<String> _selectedServices = {};
  int? _diagnosisGroupValue = 2;

  @override
  void dispose() {
    _addServiceController.dispose();
    super.dispose();
  }

  void _toggleService(String service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  void _addNewService() {
    final String newService = _addServiceController.text.trim();
    if (newService.isNotEmpty && !_services.contains(newService)) {
      setState(() {
        _services.add(newService);
      });
      _addServiceController.clear();
      FocusScope.of(context).unfocus();
    }
  }

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
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ProgressStepper(currentStep: 1, totalSteps: 3),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Keluhan Anda",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Deskripsikan keluhan yang anda rasakan",
                      style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6))),
                  const SizedBox(height: 16),
                  _buildComplaintTextField(theme),
                  const SizedBox(height: 24),
                  Text("Sudah Punya Diagnosis?",
                      style: textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  _buildDiagnosisRadioButtons(),
                  const SizedBox(height: 24),
                  Text("Layanan Kesehatan",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Pilih layanan kesehatan yang anda inginkan",
                      style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6))),
                  const SizedBox(height: 16),
                  ..._services.map((service) => ServiceSelectionTile(
                        title: service,
                        isSelected: _selectedServices.contains(service),
                        onTap: () => _toggleService(service),
                      )),
                  _buildAddServiceField(theme),
                ],
              ),
            ),
          ),
          _buildBottomButton(context, theme),
        ],
      ),
    );
  }

  Widget _buildComplaintTextField(ThemeData theme) {
    return TextField(
      maxLines: 4,
      cursorColor: theme.colorScheme.tertiary,
      decoration: InputDecoration(
        hintText: "Contoh: Nyeri kepala di bagian belakang",
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

  Widget _buildDiagnosisRadioButtons() {
    return Row(
      children: [
        Radio<int>(
          value: 1,
          groupValue: _diagnosisGroupValue,
          onChanged: (value) => setState(() => _diagnosisGroupValue = value),
        ),
        const Text("Ya"),
        const SizedBox(width: 24),
        Radio<int>(
          value: 2,
          groupValue: _diagnosisGroupValue,
          onChanged: (value) => setState(() => _diagnosisGroupValue = value),
        ),
        const Text("Tidak"),
      ],
    );
  }

  Widget _buildAddServiceField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: _addServiceController,
        cursorColor: theme.colorScheme.tertiary,
        decoration: InputDecoration(
          hintText: "Tambah layanan lain...",
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
            borderSide:
                BorderSide(color: theme.colorScheme.tertiary, width: 1.5),
          ),
          suffixIcon: IconButton(
            icon: Icon(Iconsax.add_circle, color: theme.colorScheme.tertiary),
            onPressed: _addNewService,
          ),
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
                  builder: (context) => const PatientProfileScreen()),
            );
          },
          style: customButtonStyle,
          child: const Text("Selanjutnya"),
        ),
      ),
    );
  }
}
