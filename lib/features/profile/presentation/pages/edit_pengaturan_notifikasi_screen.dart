import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// Halaman pengaturan notifikasi
// Menggunakan StatefulWidget agar bisa mengelola state (hidup/mati) dari setiap switch
class EditPengaturanNotifikasi extends StatefulWidget {
  const EditPengaturanNotifikasi({super.key});

  @override
  State<EditPengaturanNotifikasi> createState() => _EditPengaturanNotifikasiState();
}

class _EditPengaturanNotifikasiState extends State<EditPengaturanNotifikasi> {
  // State untuk setiap jenis notifikasi
  bool _enableAllNotifications = true;
  bool _reminderNotifications = true;
  bool _costUpdateNotifications = true;
  bool _promoNotifications = true;
  bool _generalHealthNotifications = true;
  bool _emergencyAlerts = true;

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
        title: const Text(
          "Pengaturan Notifikasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Widget untuk mengaktifkan/menonaktifkan semua notifikasi
              SwitchListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text(
                  "Nyalakan Semua Notifikasi",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                secondary: const Icon(Iconsax.notification_bing),
                value: _enableAllNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _enableAllNotifications = value;
                    // Sinkronisasi semua opsi lain dengan status "Nyalakan Semua"
                    _reminderNotifications = value;
                    _costUpdateNotifications = value;
                    _promoNotifications = value;
                    _generalHealthNotifications = value;
                    _emergencyAlerts = value;
                  });
                },
              ),
              const Divider(),
              // Opsi notifikasi individual yang sekarang independent
              _buildNotificationSwitch(
                title: "Pengingat Jadwal Medis",
                icon: Iconsax.calendar_tick,
                value: _reminderNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _reminderNotifications = value;
                    _checkMasterSwitch();
                  });
                },
              ),
              _buildNotificationSwitch(
                title: "Informasi Terkait Biaya",
                icon: Iconsax.wallet_check,
                value: _costUpdateNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _costUpdateNotifications = value;
                    _checkMasterSwitch();
                  });
                },
              ),
              _buildNotificationSwitch(
                title: "Promosi dan Penawaran Khusus",
                icon: Iconsax.discount_shape,
                value: _promoNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _promoNotifications = value;
                    _checkMasterSwitch();
                  });
                },
              ),
              _buildNotificationSwitch(
                title: "Informasi Kesehatan Umum",
                icon: Iconsax.health,
                value: _generalHealthNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _generalHealthNotifications = value;
                    _checkMasterSwitch();
                  });
                },
              ),
              _buildNotificationSwitch(
                title: "Peringatan Darurat",
                icon: Iconsax.danger,
                value: _emergencyAlerts,
                onChanged: (bool value) {
                  setState(() {
                    _emergencyAlerts = value;
                    _checkMasterSwitch();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat SwitchListTile agar kode lebih ringkas
  Widget _buildNotificationSwitch({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(title),
      secondary: Icon(icon),
      value: value,
      onChanged: onChanged, // Tidak lagi bergantung pada _enableAllNotifications
    );
  }

  // Fungsi untuk mengecek status "Nyalakan Semua Notifikasi"
  void _checkMasterSwitch() {
    if (_reminderNotifications &&
        _costUpdateNotifications &&
        _promoNotifications &&
        _generalHealthNotifications &&
        _emergencyAlerts) {
      _enableAllNotifications = true;
    } else {
      _enableAllNotifications = false;
    }
  }
}
