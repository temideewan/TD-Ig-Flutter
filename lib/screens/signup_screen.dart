import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter_clone/resources/auth_methods.dart';
import 'package:instagram_flutter_clone/widgets/textfield_input.dart';
import '../utils/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage(){}

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
                      // circular widget to accept and show selected file
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 54,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1645458320707-f8539c85490b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"),
                          ),
                          Positioned(
                              bottom: -10,
                              left: 70,
                              child: IconButton(
                                  onPressed: selectImage,
                                  icon: const Icon(Icons.add_a_photo)))
                        ],
                      ),
                      const SizedBox(height: 24),
                      // textfield input for username,
                      TextFieldInput(
                          textInputType: TextInputType.text,
                          textEditingController: _userNameController,
                          hintText: "Enter your user name"),
                      const SizedBox(height: 24),
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
                      TextFieldInput(
                          textInputType: TextInputType.text,
                          textEditingController: _bioController,
                          hintText: "Enter your bio"),
                      const SizedBox(height: 24),
                      InkWell(
                        onTap: () async {
                          print("we're in here");
                          String response = await AuthMethods().signUpUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                              userName: _userNameController.text,
                              bio: _bioController.text);
                          print(response);
                        },
                        child: Container(
                            child: const Text("Sign up"),
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
                            child: const Text("Have an account?"),
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                          ),
                          GestureDetector(
                            onTap: () async {
                              print("we're in here");
                              // String response = await AuthMethods().signUpUser(
                              //     email: _emailController.text,
                              //     password: _passwordController.text,
                              //     userName: _userNameController.text,
                              //     bio: _bioController.text);
                              // print(response);
                            },
                            child: Container(
                              child: const Text("Sign in",
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
