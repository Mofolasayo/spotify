import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/presentation/intro/screens/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: 20)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    navigateToGetStarted();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigateToGetStarted() {
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GetStarted()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, animation.value),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.string(AppIcons.logo),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
