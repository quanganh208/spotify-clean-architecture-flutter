import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  static const String nameRoute = '/root';

  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
