import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class AuthMethods {
  // initialize firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signup the user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    // required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty) {
        // register a new user.
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // add user to the database
        // open the collection called users in our database... Star adding users under their uid in the collection
        await _firestore.collection("users").doc(userCred.user!.uid).set({
          'username': userName,
          'uid': userCred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        });
        // another way to add a new user
        // await _firestore.collection("users").add({
        //   'username': userName,
        //   'uid': userCred.user!.uid,
        //   'email': email,
        //   'bio': bio,
        //   'followers': [],
        //   'following': [],
        // });

        res = "User created successfully";
      }
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
