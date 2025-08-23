import 'package:flutter/material.dart';
import '../../../../app/core/constants/color_constants.dart';
import '../../../estimation/presentation/widgets/custom_dropdown_field.dart';
import '../../../estimation/presentation/widgets/custom_input_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _selectedGender;
  String? _selectedInsurance;
  String? _selectedLocation;
  String? _selectedJob;

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
        title: Text(
          "Profil Pengguna",
          style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      label: "Asuransi",
                      hint: "Pilih asuransi",
                      value: _selectedInsurance,
                      items: const [
                        "BPJS",
                        "Prudential",
                        "Allianz",
                        "Tidak Punya"
                      ],
                      onChanged: (value) =>
                          setState(() => _selectedInsurance = value),
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
                      label: "Pekerjaan",
                      hint: "Pilih pekerjaan",
                      value: _selectedJob,
                      items: const [
                        "PNS",
                        "Swasta",
                        "Wiraswasta",
                        "Pelajar/Mahasiswa"
                      ],
                      onChanged: (value) =>
                          setState(() => _selectedJob = value),
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
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentBlue,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Simpan"),
        ),
      ),
    );
  }
}
