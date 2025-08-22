import 'package:flutter/material.dart';

class HospitalDetailScreen extends StatelessWidget {
  const HospitalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              title: const Text("RS Ukrida", style: TextStyle(fontSize: 16)),
              background: Image.network(
                "https://placehold.co/600x400/A0A0A0/FFFFFF?text=Dummy+Map",
                fit: BoxFit.cover,
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
                  const Text("Rumah Sakit Ukrida",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const Text("Golongan A",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 16),
                  const Text("ABOUT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  const SizedBox(height: 8),
                  const Text(
                      "Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants."),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF74B3CE),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Open in Maps",
                          style: TextStyle(color: Colors.white)),
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
