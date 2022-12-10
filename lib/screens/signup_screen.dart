import 'package:bookstore_recommendation_system_fyp/screens/login_screen.dart';
import 'package:bookstore_recommendation_system_fyp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Widgets/text_field.dart';
import '../utils/snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
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
          SvgPicture.asset('lib/assets/images/signup.svg',
              semanticsLabel: 'Signup', height: 250, width: 200),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: TextInputField(
                    hintText: 'Enter Name',
                    textInputType: TextInputType.name,
                    textEditingController: _nameController,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      if (value.length >= 15) {
                        return 'Reduce your name size';
                      }
                      return null;
                    },
                  ),
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
                      child: Text('Signup')),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          navigateWithNoBack(context, const LoginScreen());
                        },
                        child: const Text('Login'))
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
