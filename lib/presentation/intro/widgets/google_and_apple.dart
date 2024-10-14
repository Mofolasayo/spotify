import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/components/app_dimensions.dart';
import 'package:spotify/common/components/app_icons.dart';

class GoogleAndApple extends StatelessWidget {
  const GoogleAndApple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: AppDimensions.deviceHeight(context) * 0.18,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(child: Divider()),
              Text("   Or   "),
              Expanded(child: Divider())
            ],
          ),
          SizedBox(
            width: 200,
            height: 100,
            // color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.string(
                  AppIcons.googleLogo,
                  height: 31,
                ),
                SvgPicture.string(
                  AppIcons.appleLogo,
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
