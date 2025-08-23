import 'package:flutter/material.dart';

import '../../../authentication/presentation/pages/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pageData = [
    {
      'image': 'assets/images/logo-1.png',
      'title': 'HITUNG ESTIMASI BIAYA LAYANAN KESEHATAN',
      'description':
          'Hitung estimasi biaya layanan kesehatan anda dengan Patient Cost Estimator kami.',
    },
    {
      'image': 'assets/images/logo-1.png',
      'title': 'TEMUKAN RUMAH SAKIT TERDEKAT',
      'description':
          'Dapatkan rekomendasi rumah sakit terdekat sesuai dengan kebutuhan dan lokasi Anda.',
    },
    {
      'image': 'assets/images/logo-1.png',
      'title': 'INFORMASI TRANSPARAN DAN AKURAT',
      'description':
          'Kami menyediakan informasi biaya yang transparan untuk perencanaan keuangan yang lebih baik.',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToNextPage() {
    if (_currentPage == _pageData.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          _buildImageSlider(screenSize),
          _buildContentSheet(screenSize, theme),
        ],
      ),
    );
  }

  Widget _buildImageSlider(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.65,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _pageData.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset(_pageData[index]['image']!),
          );
        },
      ),
    );
  }

  Widget _buildContentSheet(Size screenSize, ThemeData theme) {
    final ButtonStyle customButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.tertiary,
      foregroundColor: theme.colorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ).merge(theme.elevatedButtonTheme.style);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenSize.height * 0.45,
        width: screenSize.width,
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageIndicatorRow(theme),
            const SizedBox(height: 24),
            _buildAnimatedTitle(theme),
            const SizedBox(height: 8),
            _buildAnimatedDescription(theme),
            const Spacer(),
            _buildNextButton(customButtonStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicatorRow(ThemeData theme) {
    return Row(
      children: List.generate(
        _pageData.length,
        (index) => _buildPageIndicatorDot(index, theme),
      ),
    );
  }

  Widget _buildPageIndicatorDot(int index, ThemeData theme) {
    bool isActive = _currentPage == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? theme.colorScheme.tertiary : theme.disabledColor,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildAnimatedTitle(ThemeData theme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        _pageData[_currentPage]['title']!,
        key: ValueKey<String>(_pageData[_currentPage]['title']!),
        style: theme.textTheme.titleLarge?.copyWith(fontSize: 24),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildAnimatedDescription(ThemeData theme) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(
        _pageData[_currentPage]['description']!,
        key: ValueKey<String>(_pageData[_currentPage]['description']!),
        style: theme.textTheme.bodyMedium,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildNextButton(ButtonStyle buttonStyle) {
    final bool isLastPage = _currentPage == _pageData.length - 1;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: _navigateToNextPage,
        child: Text(isLastPage ? "Mulai" : "Next"),
      ),
    );
  }
}
