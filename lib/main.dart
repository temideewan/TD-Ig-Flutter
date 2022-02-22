import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:instagram_flutter_clone/responsive/mobile_screen_layout.dart';
// import 'package:instagram_flutter_clone/responsive/responsive_layout_screen.dart';
// import 'package:instagram_flutter_clone/responsive/web_screen_layout.dart';
import 'package:instagram_flutter_clone/screens/login_screen.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAZ46CoFsFCUDX8AzWAZVwAAb1VBGT9b7o",
            appId: "1:235469172446:web:aed2072e6c5d33dd43dc4f",
            messagingSenderId: "235469172446",
            storageBucket: "td-igclone.appspot.com",
            projectId: "td-igclone"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagram clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // home: const ResponsiveLayout(
        //   webScreenLayout: WebScreenLayout(),
        //   mobileScreenLayout: MobileScreenLayout(),
        // ),
        home: const LoginScreen());
  }
}