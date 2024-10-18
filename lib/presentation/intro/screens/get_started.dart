import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/common/widgets/app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/intro/screens/choose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.introBG), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.string(AppIcons.logo),
              ),
              const Spacer(),
              Container(
                // color: Colors.red,
                width: AppDimensions.deviceWidth(context) * 0.85,
                height: AppDimensions.deviceHeight(context) * 0.18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Enjoy Listening To Music?",
                      style: AppTextStyles.bold(
                          fontSize: 25, color: AppColors.lightText),
                    ),
                    Text(
                      "Explore millions of songs and podcasts, personalized to your preferences, and enjoy seamless streaming anytime, anywhere.",
                      style: AppTextStyles.regular(
                          fontSize: 17, color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              AppButton(
                height: 60,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ChooseMode()));
                },
                text: 'Get Started',
              )
            ],
          ),
        ),
        IgnorePointer(
          child: Container(
            color: Colors.black.withOpacity(0.15),
          ),
        )
      ],
    ));
  }
}
