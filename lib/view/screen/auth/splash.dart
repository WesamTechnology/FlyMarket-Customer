import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOutQuart),
      ),
    );

    _mainController.forward();

    Timer(const Duration(seconds: 4), () {
      Get.offAllNamed(AppRoute.language);
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. الخلفية بتدرج لوني احترافي
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4CAF50), // أخضر زاهي
                  Color(0xff2E7D32), // أخضر غامق
                  Color(0xff1B5E20), // أخضر عميق جداً
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 2. دوائر ديكورية (Glassmorphism effect)
          Positioned(
            top: -100,
            right: -50,
            child: _buildDecorativeCircle(300, Colors.white.withOpacity(0.08)),
          ),
          Positioned(
            bottom: -50,
            left: -80,
            child: _buildDecorativeCircle(250, Colors.black.withOpacity(0.05)),
          ),

          // 3. المحتوى الرئيسي في المنتصف
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // حركة الشعار
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        AppImageAsset.splash33,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // حركة النصوص
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      children: [
                        const Text(
                          "FLY MARKET",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 4,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            "Smart Shopping & Delivery",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2,
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

          // 4. مؤشر التحميل في الأسفل
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  SizedBox(
                    width: 40,
                    height: 2,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white54),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "...LOADING",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontSize: 9,
                      letterSpacing: 5,
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

  // ويدجت لبناء الدوائر الديكورية
  Widget _buildDecorativeCircle(double size, Color color) {
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
