import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/common/components/app_textfield.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/common/components/simple_app_bar.dart';
import 'package:spotify/common/widgets/app_button.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/presentation/auth/screens/signup_screen.dart';
import 'package:spotify/presentation/dashboard/pages/home_page.dart';
import 'package:spotify/presentation/intro/widgets/google_and_apple.dart';
import 'package:spotify/service_locator.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: SvgPicture.string(
          AppIcons.logo,
          height: 33,
          width: 103,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: Column(
          children: [
            SizedBox(
              // color: Colors.yellow,
              height: AppDimensions.deviceHeight(context) * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Sign In",
                        style: AppTextStyles.black(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "If You Need Any Support",
                            style: AppTextStyles.regular(fontSize: 14),
                          ),
                          Text(" Click Here",
                              style: AppTextStyles.regular(
                                  fontSize: 14, color: AppColors.primary))
                        ],
                      ),
                    ],
                  ),
                  AppTextField(
                    hintText: "Enter Username or Email",
                    isPassword: false,
                    controller: emailController,
                  ),
                  AppTextField(
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot password?",
                        style: AppTextStyles.regular(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    width: AppDimensions.deviceWidth(context),
                    child: AppButton(
                      text: "Sign In",
                      onPressed: () async {
                        var result = await sl<SigninuseCase>().call(
                          params: SigninUserRequest(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString(),
                          ),
                        );
                        print("Your email is: ${emailController.text}");
                        print("Your password is: ${passwordController.text}");
                        result.fold((l) {
                          var snackBar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }, (r) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                              (route) => false);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const GoogleAndApple(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "Register now",
                    style: AppTextStyles.regular(color: AppColors.blue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
