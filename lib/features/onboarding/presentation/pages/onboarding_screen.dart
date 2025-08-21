import 'package:flutter/material.dart';
import '../../../authentication/presentation/pages/login_screen.dart';
import '../../domain/entities/onboarding_content.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contentList = [
    OnboardingContent(
      image: 'assets/images/logo-1.png',
      title: 'HITUNG ESTIMASI BIAYA LAYANAN KESEHATAN',
      description:
          'Hitung estimasi biaya layanan kesehatan anda dengan Patient Cost Estimator kami.',
    ),
    OnboardingContent(
      image: 'assets/images/logo-1.png',
      title: 'TEMUKAN RUMAH SAKIT TERDEKAT',
      description:
          'Dapatkan rekomendasi rumah sakit terdekat sesuai dengan kebutuhan dan lokasi Anda.',
    ),
    OnboardingContent(
      image: 'assets/images/logo-1.png',
      title: 'INFORMASI TRANSPARAN DAN AKURAT',
      description:
          'Kami menyediakan informasi biaya yang transparan untuk perencanaan keuangan yang lebih baik.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _contentList.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (_, i) {
                  return OnboardingPage(
                    image: _contentList[i].image,
                    title: _contentList[i].title,
                    description: _contentList[i].description,
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _contentList.length,
                        (index) => buildDot(index, context),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage == _contentList.length - 1) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF74B3CE),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _currentPage == _contentList.length - 1
                              ? "Done"
                              : "Next",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: _currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? const Color(0xFF74B3CE)
            : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
