import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/common/widgets/app_button.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/core/theme/app_colors.dart';
import 'package:spotify/presentation/auth/screens/sigin_or_singnup.dart';
import 'package:spotify/presentation/intro/blocs/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBG), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.string(AppIcons.logo),
              ),
              const Spacer(),
              Container(
                height: AppDimensions.deviceHeight(context) * 0.25,
                width: AppDimensions.deviceWidth(context) * 0.8,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Choose Mode",
                      style: AppTextStyles.bold(
                          fontSize: 22, color: AppColors.lightText),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.dark);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                      height: 73,
                                      width: 73,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff30393C)
                                              .withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: SvgPicture.string(
                                        AppIcons.darkIcon,
                                        fit: BoxFit.none,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Dark Mode',
                              style: AppTextStyles.bold(
                                  fontSize: 16, color: AppColors.lightText),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<ThemeCubit>()
                                    .updateTheme(ThemeMode.light);
                              },
                              child: ClipOval(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                      height: 73,
                                      width: 73,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff30393C)
                                              .withOpacity(0.5),
                                          shape: BoxShape.circle),
                                      child: SvgPicture.string(
                                        AppIcons.lightIcon,
                                        fit: BoxFit.none,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Text(
                              'Light Mode',
                              style: AppTextStyles.bold(
                                  fontSize: 16, color: AppColors.lightText),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppDimensions.deviceHeight(context) * 0.05,
              ),
              AppButton(
                height: 60,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninOrSignup()),
                  );
                },
                text: 'Continue',
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
