import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up_or_sign_in.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  static const String nameRoute = '/choose-mode';

  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage(AppImages.chooseModeBG),
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
        _chooseMode(context),
      ]),
    );
  }

  SizedBox _chooseMode(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 50,
        ),
        child: Column(
          children: [
            SvgPicture.asset(AppVectors.logo),
            const Spacer(),
            const Text(
              'Choose Mode',
              style: TextStyle(
                color: AppColors.whiteGetStarted,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 43),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dark Mode
                    GestureDetector(
                      onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.dark),
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppVectors.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 71),
                    // Light Mode
                    GestureDetector(
                      onTap: () => context.read<ThemeCubit>().updateTheme(ThemeMode.light),
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: const Color(0xff30393C).withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppVectors.sun,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(width: 71),
                    Text(
                      "Light Mode",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 68),
            BasicAppButton(
              onPressed: () => Navigator.pushNamed(
                context,
                SignUpOrSignInPage.nameRoute,
              ),
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
