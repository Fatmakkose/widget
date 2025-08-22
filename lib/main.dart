import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 4) {
      // 5 ekran var (0, 1, 2, 3 ve 4)
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    // Spacing and sizing based on device size
    final double horizontalPadding = width * 0.07; // 7% of width
    final double topPadding = height * 0.06; // 6% of height
    final double progressBarWidth =
        width * 0.12; // each dash width - sayfaya uygun
    final double progressBarHeight = height * 0.008; // dash height - daha ince
    final double progressBarGap = width * 0.025; // gap between dashes - daha az
    final double titleFontSize =
        height * 0.035; // responsive font for title - daha büyük
    final double descriptionFontSize =
        height * 0.025; // responsive font - ekrana sığacak
    final double illustrationSize = width * 0.58; // square image size
    final double backgroundLogoSize =
        width * 2.5; // ekranı tamamen kaplayacak logo boyutu
    final double nextButtonSize = width * 0.16; // rounded square button size
    final double nextButtonRadius = width * 0.04;

    const Color primaryBg = Color(0xFFAB9DFF); // Yeni arka plan rengi
    const Color darkPurple = Color(0xFF3B2E5A);
    const Color progressActive = Color(0xFF403E66); // Aktif bar rengi
    const Color progressInactive = Color(0xFFFFFFFF); // Diğer bar rengi

    final double contentTopPadding = height * 0.02;

    return Scaffold(
      backgroundColor: primaryBg,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background EkomAI logo
          IgnorePointer(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: backgroundLogoSize,
                height: backgroundLogoSize,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Logo yüklenemedi: $error');
                    return Container(
                      width: backgroundLogoSize,
                      height: backgroundLogoSize,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Content with fixed header and footer
          SafeArea(
            child: Column(
              children: [
                // Header (Progress indicators)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    topPadding,
                    horizontalPadding,
                    height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final bool isActive = index == _currentPage;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 4 ? progressBarGap : 0,
                        ),
                        child: Container(
                          width: progressBarWidth,
                          height: progressBarHeight,
                          decoration: BoxDecoration(
                            color: isActive ? progressActive : progressInactive,
                            borderRadius: BorderRadius.circular(
                              progressBarHeight,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Page content
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      // First Page
                      _buildFirstPage(
                        context,
                        width,
                        height,
                        horizontalPadding,
                        contentTopPadding,
                        progressBarWidth,
                        progressBarHeight,
                        progressBarGap,
                        titleFontSize,
                        descriptionFontSize,
                        illustrationSize,
                        nextButtonSize,
                        nextButtonRadius,
                        progressActive,
                        progressInactive,
                        darkPurple,
                      ),

                      // Second Page
                      _buildSecondPage(
                        context,
                        width,
                        height,
                        horizontalPadding,
                        contentTopPadding,
                        progressBarWidth,
                        progressBarHeight,
                        progressBarGap,
                        titleFontSize,
                        descriptionFontSize,
                        illustrationSize,
                        nextButtonSize,
                        nextButtonRadius,
                        progressActive,
                        progressInactive,
                        darkPurple,
                      ),

                      // Third Page
                      _buildFourthPage(
                        context,
                        width,
                        height,
                        horizontalPadding,
                        contentTopPadding,
                        progressBarWidth,
                        progressBarHeight,
                        progressBarGap,
                        titleFontSize,
                        descriptionFontSize,
                        illustrationSize,
                        nextButtonSize,
                        nextButtonRadius,
                        progressActive,
                        progressInactive,
                        darkPurple,
                      ),

                      // Fourth Page
                      _buildThirdPage(
                        context,
                        width,
                        height,
                        horizontalPadding,
                        contentTopPadding,
                        progressBarWidth,
                        progressBarHeight,
                        progressBarGap,
                        titleFontSize,
                        descriptionFontSize,
                        illustrationSize,
                        nextButtonSize,
                        nextButtonRadius,
                        progressActive,
                        progressInactive,
                        darkPurple,
                      ),

                      // Fifth Page
                      _buildFifthPage(
                        context,
                        width,
                        height,
                        horizontalPadding,
                        contentTopPadding,
                        progressBarWidth,
                        progressBarHeight,
                        progressBarGap,
                        titleFontSize,
                        descriptionFontSize,
                        illustrationSize,
                        nextButtonSize,
                        nextButtonRadius,
                        progressActive,
                        progressInactive,
                        darkPurple,
                      ),
                    ],
                  ),
                ),

                // Footer (Navigation buttons)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    height * 0.01,
                    horizontalPadding,
                    height * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: nextButtonSize,
                        height: nextButtonSize,
                        child: ElevatedButton(
                          onPressed: _currentPage > 0 ? _previousPage : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkPurple,
                            disabledBackgroundColor: darkPurple.withOpacity(
                              0.4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                nextButtonRadius,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: nextButtonSize,
                        height: nextButtonSize,
                        child: ElevatedButton(
                          onPressed: _currentPage < 4 ? _nextPage : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkPurple,
                            disabledBackgroundColor: darkPurple.withOpacity(
                              0.4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                nextButtonRadius,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 0,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPage(
    BuildContext context,
    double width,
    double height,
    double horizontalPadding,
    double topPadding,
    double progressBarWidth,
    double progressBarHeight,
    double progressBarGap,
    double titleFontSize,
    double descriptionFontSize,
    double illustrationSize,
    double nextButtonSize,
    double nextButtonRadius,
    Color progressActive,
    Color progressInactive,
    Color darkPurple,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),

          // Title
          Text(
            'KİŞİLEŞTİRİLMİŞ\nHARCAMA ANALİZİ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: titleFontSize,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: height * 0.03),

          // Illustration
          Expanded(
            child: Center(
              child: SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: Image.asset(
                  'assets/images/ekran1.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Ana görsel yüklenemedi: $error');
                    return Container(
                      width: illustrationSize,
                      height: illustrationSize,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.04),

          // Description (max 3 lines)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Gelir ve giderlerini anında kategorilere ayır,hangi alanda ne kadar harcadığını net şekilde gör.',
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkPurple,
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Widget _buildSecondPage(
    BuildContext context,
    double width,
    double height,
    double horizontalPadding,
    double topPadding,
    double progressBarWidth,
    double progressBarHeight,
    double progressBarGap,
    double titleFontSize,
    double descriptionFontSize,
    double illustrationSize,
    double nextButtonSize,
    double nextButtonRadius,
    Color progressActive,
    Color progressInactive,
    Color darkPurple,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),

          // Title
          Text(
            'AKILLI BÜTÇE\nPLANLAYICI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: titleFontSize,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: height * 0.03),

          // Illustration
          Expanded(
            child: Center(
              child: SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: Image.asset(
                  'assets/images/ekran2.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('İkinci görsel yüklenemedi: $error');
                    return Container(
                      width: illustrationSize,
                      height: illustrationSize,
                      child: const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.04),

          // Description (max 3 lines)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Aylık gelir ve gider hedeflerini belirle.',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkPurple,
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Widget _buildThirdPage(
    BuildContext context,
    double width,
    double height,
    double horizontalPadding,
    double topPadding,
    double progressBarWidth,
    double progressBarHeight,
    double progressBarGap,
    double titleFontSize,
    double descriptionFontSize,
    double illustrationSize,
    double nextButtonSize,
    double nextButtonRadius,
    Color progressActive,
    Color progressInactive,
    Color darkPurple,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),

          // Title
          Text(
            'KARBON AYAK İZİ\nVE\nDETOKS PROGRAMI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: titleFontSize,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: height * 0.03),

          // Illustration
          Expanded(
            child: Center(
              child: SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: Image.asset(
                  'assets/images/ekran3.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Üçüncü görsel yüklenemedi: $error');
                    return Container(
                      width: illustrationSize,
                      height: illustrationSize,
                      child: const Icon(
                        Icons.eco,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.04),

          // Description (max 3 lines)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Karbon ayak izinizi hesaplayın, detoksunuzu bugün başlatın.',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkPurple,
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Widget _buildFourthPage(
    BuildContext context,
    double width,
    double height,
    double horizontalPadding,
    double topPadding,
    double progressBarWidth,
    double progressBarHeight,
    double progressBarGap,
    double titleFontSize,
    double descriptionFontSize,
    double illustrationSize,
    double nextButtonSize,
    double nextButtonRadius,
    Color progressActive,
    Color progressInactive,
    Color darkPurple,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),

          // Title
          Text(
            'FİŞ OKUMA İLE\nOTOMATİK VERİ GİRİŞİ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: titleFontSize,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: height * 0.03),

          // Illustration
          Expanded(
            child: Center(
              child: SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: Image.asset(
                  'assets/images/ekran4.png', // Bu görsel için uygun bir resim eklenebilir
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Dördüncü görsel yüklenemedi: $error');
                    return Container(
                      width: illustrationSize,
                      height: illustrationSize,
                      child: const Icon(
                        Icons.receipt_long,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.04),

          // Description (max 3 lines)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Fişini okut, uygulama otomatik olarak verileri kaydetsin.',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkPurple,
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Widget _buildFifthPage(
    BuildContext context,
    double width,
    double height,
    double horizontalPadding,
    double topPadding,
    double progressBarWidth,
    double progressBarHeight,
    double progressBarGap,
    double titleFontSize,
    double descriptionFontSize,
    double illustrationSize,
    double nextButtonSize,
    double nextButtonRadius,
    Color progressActive,
    Color progressInactive,
    Color darkPurple,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        topPadding,
        horizontalPadding,
        height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height * 0.02),

          // Title
          Text(
            'YAPAY ZEKÂ DESTEKLİ\nFİNANS ASİSTANI',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: titleFontSize,
              letterSpacing: 1.0,
            ),
          ),

          SizedBox(height: height * 0.03),

          // Illustration
          Expanded(
            child: Center(
              child: SizedBox(
                width: illustrationSize,
                height: illustrationSize,
                child: Image.asset(
                  'assets/images/ekran5.png', // Bu görsel için uygun bir resim eklenebilir
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    print('Beşinci görsel yüklenemedi: $error');
                    return Container(
                      width: illustrationSize,
                      height: illustrationSize,
                      child: const Icon(
                        Icons.smart_toy,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: height * 0.04),

          // Description (max 3 lines)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text(
              'Akıllı sohbet robotuyla finansal sorularına yanıt al, bilinçli kararlar ver.',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkPurple,
                fontSize: descriptionFontSize,
                fontWeight: FontWeight.w900,
                height: 1.4,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
