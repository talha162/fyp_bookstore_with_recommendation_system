import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/navigation.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80.0,
                ),
                SvgPicture.asset('lib/assets/images/welcome.svg',
                    semanticsLabel: 'Login', height: 250, width: 200),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateWithNoBack(context, const LoginScreen());
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 75.0, vertical: 12.0),
                      child: Text('Login')),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateWithNoBack(context, const SignUpScreen());
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 12.0),
                      child: Text('Create New Account')),
                ),
              ],
            ),
          ],
        ));
  }
}
