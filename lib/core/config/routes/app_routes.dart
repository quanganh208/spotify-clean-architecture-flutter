import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_in.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up_or_sign_in.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';
import 'package:spotify_clone/presentation/intro/pages/get_started.dart';
import 'package:spotify_clone/presentation/root/pages/root.dart';
import 'package:spotify_clone/presentation/splash/pages/splash.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.nameRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case GetStartedPage.nameRoute:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case ChooseModePage.nameRoute:
        return MaterialPageRoute(builder: (_) => const ChooseModePage());
      case SignUpOrSignInPage.nameRoute:
        return MaterialPageRoute(builder: (_) => const SignUpOrSignInPage());
      case SignUpPage.nameRoute:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case SignInPage.nameRoute:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case RootPage.nameRoute:
        return MaterialPageRoute(builder: (_) => const RootPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
