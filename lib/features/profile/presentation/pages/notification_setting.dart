import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditPengaturanNotifikasiScreen extends StatefulWidget {
  const EditPengaturanNotifikasiScreen({super.key});

  @override
  State<EditPengaturanNotifikasiScreen> createState() =>
      _EditPengaturanNotifikasiScreenState();
}

class _EditPengaturanNotifikasiScreenState
    extends State<EditPengaturanNotifikasiScreen> {
  bool _enableAllNotifications = true;
  bool _reminderNotifications = true;
  bool _costUpdateNotifications = true;
  bool _promoNotifications = true;
  bool _generalHealthNotifications = true;
  bool _emergencyAlerts = true;

  void _checkMasterSwitch() {
    final bool allEnabled = _reminderNotifications &&
        _costUpdateNotifications &&
        _promoNotifications &&
        _generalHealthNotifications &&
        _emergencyAlerts;
    if (allEnabled != _enableAllNotifications) {
      setState(() {
        _enableAllNotifications = allEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2, color: theme.colorScheme.onSurface),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Pengaturan Notifikasi",
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildNotificationSwitch(
                theme: theme,
                title: "Nyalakan Semua Notifikasi",
                icon: Iconsax.notification_bing,
                isTitle: true,
                value: _enableAllNotifications,
                onChanged: (bool value) {
                  setState(() {
                    _enableAllNotifications = value;
                    _reminderNotifications = value;
                    _costUpdateNotifications = value;
                    _promoNotifications = value;
                    _generalHealthNotifications = value;
                    _emergencyAlerts = value;
                  });
                },
              ),
              const Divider(),
              _buildNotificationSwitch(
                theme: theme,
                title: "Pengingat Jadwal Medis",
                icon: Iconsax.calendar_tick,
                value: _reminderNotifications,
                onChanged: (bool value) {
                  setState(() => _reminderNotifications = value);
                  _checkMasterSwitch();
                },
              ),
              _buildNotificationSwitch(
                theme: theme,
                title: "Informasi Terkait Biaya",
                icon: Iconsax.wallet_check,
                value: _costUpdateNotifications,
                onChanged: (bool value) {
                  setState(() => _costUpdateNotifications = value);
                  _checkMasterSwitch();
                },
              ),
              _buildNotificationSwitch(
                theme: theme,
                title: "Promosi dan Penawaran Khusus",
                icon: Iconsax.discount_shape,
                value: _promoNotifications,
                onChanged: (bool value) {
                  setState(() => _promoNotifications = value);
                  _checkMasterSwitch();
                },
              ),
              _buildNotificationSwitch(
                theme: theme,
                title: "Informasi Kesehatan Umum",
                icon: Iconsax.health,
                value: _generalHealthNotifications,
                onChanged: (bool value) {
                  setState(() => _generalHealthNotifications = value);
                  _checkMasterSwitch();
                },
              ),
              _buildNotificationSwitch(
                theme: theme,
                title: "Peringatan Darurat",
                icon: Iconsax.danger,
                value: _emergencyAlerts,
                onChanged: (bool value) {
                  setState(() => _emergencyAlerts = value);
                  _checkMasterSwitch();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch({
    required ThemeData theme,
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isTitle = false,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      secondary: Icon(icon, color: theme.colorScheme.tertiary),
      value: value,
      onChanged: onChanged,
      activeColor: theme.colorScheme.tertiary,
    );
  }
}
