import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/common/components/simple_app_bar.dart';
import 'package:spotify/common/widgets/app_button.dart';
import 'package:spotify/core/assets/app_images.dart';
import 'package:spotify/presentation/auth/screens/signin_screen.dart';
import 'package:spotify/presentation/auth/screens/signup_screen.dart';

class SigninOrSignup extends StatelessWidget {
  const SigninOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Stack(
        children: [
          const SimpleAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.string(AppIcons.topSpiral),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.string(AppIcons.bottomSpiral),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                // color: Colors.red,
                height: AppDimensions.deviceHeight(context) * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppDimensions.deviceHeight(context) * 0.01,
                    ),
                    SvgPicture.string(AppIcons.logo),
                    SizedBox(
                      height: AppDimensions.deviceHeight(context) * 0.06,
                    ),
                    Text(
                      "Enjoy Listening to Music",
                      style: AppTextStyles.bold(fontSize: 26),
                    ),
                    Text(
                      "Discover songs and podcasts, tailored for you.",
                      style: AppTextStyles.regular(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppDimensions.deviceHeight(context) * 0.01,
                    ),
                    SizedBox(
                      // color: Colors.red,
                      width: AppDimensions.deviceWidth(context) * 0.7,
                      height: AppDimensions.deviceHeight(context) * 0.1,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 140,
                            child: AppButton(
                                text: "Register",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                    ),
                                  );
                                }),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 50,
                            width: 140,
                            child: AppButton(
                                text: "Sign in",
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninScreen(),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        // height: AppDimensions.deviceHeight(context) * 0.1,
                        )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
