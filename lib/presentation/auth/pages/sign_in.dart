import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/core/config/assets/app_vectors.dart';
import 'package:spotify_clone/data/models/sign_in_user.dart';
import 'package:spotify_clone/domain/usecases/auth/sign_in.dart';
import 'package:spotify_clone/presentation/auth/bloc/password_visibility_cubit.dart';
import 'package:spotify_clone/presentation/auth/pages/sign_up.dart';
import 'package:spotify_clone/presentation/root/pages/root.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInPage extends StatelessWidget {
  static const String nameRoute = '/signin';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: BasicAppBar(
            title: SvgPicture.asset(
              AppVectors.logo,
              height: 33,
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                _signInText(),
                const SizedBox(height: 76),
                _emailField(context),
                const SizedBox(height: 16),
                BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isObscure) {
                    return _passwordField(context, isObscure);
                  },
                ),
                const SizedBox(height: 61),
                BasicAppButton(
                  onPressed: () async {
                    final result = await sl<SignInUseCase>().call(
                      params: SignInUser(
                        email: _emailController.text.toString(),
                        password: _passwordController.text.toString(),
                      ),
                    );
                    result.fold(
                      (left) {
                        final snackBar = SnackBar(
                          content: Text(
                            left,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          duration: const Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      (right) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RootPage.nameRoute,
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: "Sign In",
                  height: 83,
                ),
              ],
            ),
          ),
          bottomNavigationBar: _signupText(context),
        ),
      ),
    );
  }

  Text _signInText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  TextField _emailField(BuildContext context) {
    return TextField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      cursorColor: context.isDarkMode ? Colors.white : Colors.black,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  TextField _passwordField(BuildContext context, bool isObscure) {
    return TextField(
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscure,
      cursorColor: context.isDarkMode ? Colors.white : Colors.black,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            onPressed: () {
              context.read<PasswordVisibilityCubit>().toggleVisibility();
            },
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, SignUpPage.nameRoute),
            child: const Text(
              'Register Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff288CE9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
