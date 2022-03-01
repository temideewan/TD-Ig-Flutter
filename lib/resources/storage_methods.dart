import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";

class StorageMethods {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    // childname is sort of the folder structure.
    // so every time we do .child we're going a folder deeper
    // if it exists we upload, if it doesn't, we create and then upload
    Reference ref =
        _firebaseStorage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask task = ref.putData(file);

    TaskSnapshot snap = await task;
    String url = await snap.ref.getDownloadURL();
    return url;
  }
}
