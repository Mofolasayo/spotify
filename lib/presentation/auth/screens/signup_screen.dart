import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';
import 'package:spotify/common/components/app_textfield.dart';
import 'package:spotify/common/components/app_textstyle.dart';
import 'package:spotify/common/components/simple_app_bar.dart';
import 'package:spotify/common/widgets/app_button.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/presentation/auth/screens/signin_screen.dart';
import 'package:spotify/presentation/dashboard/pages/home_page.dart';
import 'package:spotify/presentation/intro/widgets/google_and_apple.dart';
import 'package:spotify/service_locator.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
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
        ),
        child: Column(
          children: [
            SizedBox(
              // color: Colors.yellow,
              height: AppDimensions.deviceHeight(context) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Register",
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
                    hintText: "Full Name",
                    isPassword: false,
                    controller: fullNameController,
                  ),
                  AppTextField(
                    hintText: "Enter Email",
                    isPassword: false,
                    controller: emailController,
                  ),
                  AppTextField(
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 70,
                    width: AppDimensions.deviceWidth(context),
                    child: AppButton(
                      text: "Create Account",
                      onPressed: () async {
                        var result = await sl<SignupuseCase>().call(
                          params: CreateUserRequest(
                            fullName: fullNameController.text.toString(),
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
                const Text("Do you have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SigninScreen()));
                  },
                  child: Text(
                    "Sign in",
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
