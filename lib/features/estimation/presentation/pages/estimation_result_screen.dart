import 'package:flutter/material.dart';
import '../../../main_app/presentation/pages/main_screen.dart';

class EstimationResultScreen extends StatelessWidget {
  const EstimationResultScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hasil Estimasi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Berikut adalah hasil estimasi biaya layanan kesehatan anda",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 24),
            const Text(
              "Total Estimasi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCostCard(),
            const Spacer(),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCostCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildCostRow("Layanan Kesehatan", "Rp100.000"),
          _buildCostRow("Konsultasi Dokter", "Rp750.000",
              subtext: "-Rp500.000 (BPJS)"),
          _buildCostRow("Obat-obatan", "Rp200.000",
              subtext: "-Rp180.000 (BPJS)"),
          const Divider(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(13),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _buildCostRow("Total", "Rp370.000", isTotal: true),
          ),
        ],
      ),
    );
  }

  Widget _buildCostRow(String item, String price,
      {String? subtext, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            item,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? const Color(0xFF004346) : Colors.black87,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isTotal ? const Color(0xFF004346) : Colors.black,
                  fontSize: isTotal ? 18 : 16,
                ),
              ),
              if (subtext != null)
                Text(
                  subtext,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30), // Perubahan di sini
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MainScreen(initialIndex: 2)),
              (Route<dynamic> route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF74B3CE),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text("Gunakan Rekomendasi",
              style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
