import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../authentication/screens/auth_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _floatingController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _contentOpacity;
  late Animation<Offset> _contentSlide;
  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();

    // Main entrance animation
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    // Continuous floating animation
    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _logoScale = Tween<double>(
      begin: 0.65,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.0,
          0.45,
          curve: Curves.easeOutBack,
        ),
      ),
    );

    _logoOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.0,
          0.35,
          curve: Curves.easeIn,
        ),
      ),
    );

    _contentOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.30,
          0.70,
          curve: Curves.easeIn,
        ),
      ),
    );

    _contentSlide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.30,
          0.70,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _buttonOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.65,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );

    _buttonSlide = Tween<Offset>(
      begin: const Offset(0, 0.35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(
          0.65,
          1.0,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  void _openAuthentication() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 650),
        pageBuilder: (_, animation, __) {
          return const AuthScreen();
        },
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.05),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          // --------------------------------------------------
          // BACKGROUND
          // --------------------------------------------------

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF4FBF6),
                    Color(0xFFE8F6EF),
                    Color(0xFFF7FAF8),
                  ],
                ),
              ),
            ),
          ),

          // Soft background circles
          Positioned(
            top: -80,
            right: -70,
            child: _backgroundCircle(
              size: 230,
              color: AppTheme.softGreen,
            ),
          ),

          Positioned(
            bottom: 80,
            left: -100,
            child: _backgroundCircle(
              size: 250,
              color: const Color(0xFFE1F3E8),
            ),
          ),

          SafeArea(
            child: AnimatedBuilder(
              animation: _floatingController,
              builder: (context, child) {
                final movement =
                    math.sin(_floatingController.value * math.pi) * 8;

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      30,
                      24,
                      28,
                    ),
                    child: Column(
                      children: [

                        // ------------------------------------------------
                        // SMALL TOP BRAND
                        // ------------------------------------------------

                        FadeTransition(
                          opacity: _logoOpacity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: AppTheme.primaryGreen,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.eco_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Text(
                                'PACHAPP',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.2,
                                  color: AppTheme.darkGreen,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 38),

                        // ------------------------------------------------
                        // MAIN ANIMATED LOGO
                        // ------------------------------------------------

                        FadeTransition(
                          opacity: _logoOpacity,
                          child: Transform.scale(
                            scale: _logoScale.value,
                            child: Transform.translate(
                              offset: Offset(0, -movement),
                              child: _buildMainLogo(),
                            ),
                          ),
                        ),

                        const SizedBox(height: 38),

                        // ------------------------------------------------
                        // TITLE + DESCRIPTION
                        // ------------------------------------------------

                        SlideTransition(
                          position: _contentSlide,
                          child: FadeTransition(
                            opacity: _contentOpacity,
                            child: Column(
                              children: [
                                const Text(
                                  'A Cleaner Future\nStarts With Us',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 34,
                                    height: 1.08,
                                    fontWeight: FontWeight.w800,
                                    color: AppTheme.darkGreen,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                const Text(
                                  'Smart waste management powered by '
                                      'technology, people and rewards.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: AppTheme.textMedium,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Feature pills
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    _featurePill(
                                      Icons.recycling_rounded,
                                      'Smart Collection',
                                    ),
                                    _featurePill(
                                      Icons.verified_rounded,
                                      'AI Verified',
                                    ),
                                    _featurePill(
                                      Icons.stars_rounded,
                                      'Earn Rewards',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 38),

                        // ------------------------------------------------
                        // GET STARTED BUTTON
                        // ------------------------------------------------

                        SlideTransition(
                          position: _buttonSlide,
                          child: FadeTransition(
                            opacity: _buttonOpacity,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 58,
                                  child: ElevatedButton(
                                    onPressed: _openAuthentication,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      AppTheme.primaryGreen,
                                      foregroundColor: Colors.white,
                                      elevation: 5,
                                      shadowColor: AppTheme.primaryGreen
                                          .withValues(alpha: 0.25),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Get Started',
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 14),

                                const Text(
                                  'Reduce • Segregate • Recycle • Earn',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppTheme.textMedium,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // ------------------------------------------------
                        // BOTTOM MESSAGE
                        // ------------------------------------------------

                        FadeTransition(
                          opacity: _buttonOpacity,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.75),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppTheme.border,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.eco_rounded,
                                  color: AppTheme.primaryGreen,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    'Cleaner communities. Healthier environment.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: AppTheme.textDark,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN PACHAPP LOGO
  // ============================================================

  Widget _buildMainLogo() {
    return Container(
      width: 245,
      height: 245,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF35C46A),
            AppTheme.primaryGreen,
            Color(0xFF006B48),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryGreen.withValues(alpha: 0.22),
            blurRadius: 35,
            spreadRadius: 4,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [

          // Inner glow
          Container(
            width: 185,
            height: 185,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.96),
            ),
          ),

          // Recycling symbol
          const Icon(
            Icons.recycling_rounded,
            size: 112,
            color: AppTheme.primaryGreen,
          ),

          // PACHAPP label
          Positioned(
            bottom: 37,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: AppTheme.darkGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'PACHAPP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FEATURE PILL
  // ============================================================

  Widget _featurePill(
      IconData icon,
      String text,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 17,
            color: AppTheme.primaryGreen,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.textDark,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BACKGROUND CIRCLE
  // ============================================================

  Widget _backgroundCircle({
    required double size,
    required Color color,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}