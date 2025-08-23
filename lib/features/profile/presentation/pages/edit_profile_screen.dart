import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
        title: Text(
          "Profil Pengguna",
          style: textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurface, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                    onChanged: (value) => setState(() => _selectedJob = value),
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
            Navigator.of(context).pop();
          },
          style: customButtonStyle,
          child: const Text("Simpan"),
        ),
      ),
    );
  }
}
