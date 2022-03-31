import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter_clone/resources/auth_methods.dart';
import 'package:instagram_flutter_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter_clone/responsive/web_screen_layout.dart';
import 'package:instagram_flutter_clone/screens/signup_screen.dart';
import 'package:instagram_flutter_clone/utils/utils.dart';
import 'package:instagram_flutter_clone/widgets/textfield_input.dart';
import '../responsive/responsive_layout_screen.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    setState(() {
      _isLoading = false;
    });

    if (res != "success") {
      showSnackBar(context, res);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                webScreenLayout: WebScreenLayout(),
                mobileScreenLayout: MobileScreenLayout(),
              )));
    }
  }

  void navigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(child: Container(), flex: 2),
                      // svg image
                      SvgPicture.asset('assets/ig_logo.svg',
                          color: primaryColor, height: 64),
                      const SizedBox(height: 54),
                      // textfield input for email,
                      TextFieldInput(
                          textInputType: TextInputType.emailAddress,
                          textEditingController: _emailController,
                          hintText: "Enter your email"),
                      const SizedBox(height: 24),
                      // textfield input for password,
                      TextFieldInput(
                          textInputType: TextInputType.text,
                          textEditingController: _passwordController,
                          hintText: "Enter your password",
                          isPass: true),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: loginUser,
                        child: Container(
                            child: _isLoading
                                ? const CircularProgressIndicator.adaptive(
                                    backgroundColor: primaryColor)
                                : const Text("Login"),
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: const ShapeDecoration(
                                color: blueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))))),
                      ),
                      const SizedBox(height: 12),
                      Flexible(child: Container(), flex: 2),
                      // button
                      // transitioning to sign up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: const Text("Don't have an account?"),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                          ),
                          GestureDetector(
                            onTap: navigateToSignup,
                            child: Container(
                              child: const Text("Sign up",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                            ),
                          )
                        ],
                      )
                    ]))));
  }
}
