import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSize {
  const SimpleAppBar({super.key, this.title});
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      title: title ?? const Text(""),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: context.isDarkMode
                  ? Colors.white.withOpacity(0.03)
                  : Colors.black.withOpacity(0.03),
              shape: BoxShape.circle),
          child: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
