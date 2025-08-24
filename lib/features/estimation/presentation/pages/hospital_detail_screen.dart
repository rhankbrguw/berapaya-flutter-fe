import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HospitalDetailScreen extends StatelessWidget {
  const HospitalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: theme.primaryColor,
            leading: IconButton(
              icon: Icon(Iconsax.arrow_left_2,
                  color: theme.colorScheme.onPrimary),
              onPressed: () => Navigator.of(context).pop(),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "RS Ukrida",
                style: textTheme.titleLarge
                    ?.copyWith(color: theme.colorScheme.onPrimary),
              ),
              background: Image.network(
                "https://images.unsplash.com/photo-1574786700282-AC5a14f2db63?q=80&w=1974&auto=format&fit=crop",
                fit: BoxFit.cover,
                color: theme.colorScheme.onPrimary.withValues(alpha: 0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageCarousel(),
                  const SizedBox(height: 24),
                  Text(
                    "Rumah Sakit Ukrida",
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Golongan A",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "ABOUT",
                    style: textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants.",
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  _buildBottomButton(context, theme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel() {
    final List<String> images = [
      "https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=2073&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1626302636234-a78b52a7b4a8?q=80&w=2070&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1551601651-2a8555f1a136?q=80&w=1812&auto=format&fit=crop",
    ];

    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(images[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context, ThemeData theme) {
    final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
    ).merge(theme.elevatedButtonTheme.style);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: customButtonStyle,
        child: const Text("Buka di Maps"),
      ),
    );
  }
}
