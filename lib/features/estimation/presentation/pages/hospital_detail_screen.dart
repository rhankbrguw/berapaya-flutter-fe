import 'package:flutter/material.dart';
import '../../../../app/core/constants/color_constants.dart';

class HospitalDetailScreen extends StatelessWidget {
  const HospitalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text("RS Ukrida",
                  style:
                      textTheme.titleMedium?.copyWith(color: AppColors.white)),
              background: Image.network(
                "https://placehold.co/600x400/A0A0A0/FFFFFF?text=Dummy+Map",
                fit: BoxFit.cover,
                color: Colors.black.withAlpha(102),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: PageView(
                      children: [
                        _buildImageCarouselItem(
                            "https://placehold.co/600x400/d6f3f4/172a3a?text=RS+1"),
                        _buildImageCarouselItem(
                            "https://placehold.co/600x400/d6f3f4/172a3a?text=RS+2"),
                        _buildImageCarouselItem(
                            "https://placehold.co/600x400/d6f3f4/172a3a?text=RS+3"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text("Rumah Sakit Ukrida",
                      style: textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text("Golongan A",
                      style: textTheme.bodyMedium
                          ?.copyWith(color: AppColors.grey)),
                  const SizedBox(height: 16),
                  Text("ABOUT",
                      style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.grey)),
                  const SizedBox(height: 8),
                  Text(
                      "Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants.",
                      style: textTheme.bodyMedium),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentBlue,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Open in Maps"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarouselItem(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
