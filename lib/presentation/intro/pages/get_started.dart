import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_images.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/core/config/theme/app_colors.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  static const String nameRoute = '/get-started';

  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // SizedBox with Image
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage(AppImages.introBG),
            fit: BoxFit.fill,
          ),
        ),
        // SizedBox with Opacity
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
        // SizedBox with Column
        SizedBox(
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
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    color: AppColors.whiteGetStarted,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 21),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                  style: TextStyle(
                    color: AppColors.greyGetStarted,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 37),
                BasicAppButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    ChooseModePage.nameRoute,
                  ),
                  title: "Get Started",
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
