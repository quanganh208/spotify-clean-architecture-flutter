import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    this.title,
    super.key,
  });

  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const SizedBox(),
      leading: IconButton(
        icon: SizedBox(
          height: 40,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: context.isDarkMode ? Colors.white : Colors.black,
                size: 18,
              ),
            ),
          ),
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
