import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_in.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up.dart';

class SignUpOrSignInPage extends StatelessWidget {
  static const String nameRoute = '/sign-up-or-sign-in';

  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topUnion),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomUnion),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          _buildContent(context),
        ],
      ),
    );
  }

  Align _buildContent(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppVectors.logo),
            const SizedBox(height: 55),
            const Text(
              "Enjoy Listening To Music",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 21),
            const Text(
              "Spotify is a proprietary Swedish audio streaming and media services provider ",
              style: TextStyle(
                fontSize: 17,
                color: AppColors.greyGetStarted,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: BasicAppButton(
                    height: 73,
                    title: "Register",
                    onPressed: () => Navigator.pushNamed(
                      context,
                      SignUpPage.nameRoute,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 73,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        SignInPage.nameRoute,
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: context.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
