import "package:flutter/material.dart";
import 'package:instagram_flutter_clone/models/user.dart';
import 'package:instagram_flutter_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  User get getUser => _user!;
  final AuthMethods _authmethods = AuthMethods();

  Future<void> refreshUser() async {
    User user = await _authmethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
