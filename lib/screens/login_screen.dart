import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/svg.dart';
import '../Widgets/text_field.dart';
import '../utils/navigation.dart';
import '../utils/snackbar.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset('lib/assets/images/login.svg',
              semanticsLabel: 'Login', height: 250, width: 200),
          Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: TextInputField(
                    hintText: 'Enter Email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'plz enter valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: TextInputField(
                    hintText: 'Enter Password',
                    textInputType: TextInputType.visiblePassword,
                    textEditingController: _passwordController,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Your password shoud have 8 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnackBar(context, 'data processing');
                    }
                  },
                  child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 75.0, vertical: 12.0),
                      child: Text('Login')),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SignInButton(
                  Buttons.Google,
                  text: "Sign in with Google",
                  onPressed: () {
                    showSnackBar(context, 'Sign in with google');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          navigateWithNoBack(context, const SignUpScreen());
                        },
                        child: const Text('Signup'))
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
