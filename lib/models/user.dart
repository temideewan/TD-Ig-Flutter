import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String userName;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;

  const User({
    required this.userName,
    required this.uid,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'username': userName,
        'uid': uid,
        'email': email,
        'bio': bio,
        'followers': followers,
        'following': following,
        'photoUrl': photoUrl,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      userName: snapshot['username'] as String,
      uid: snapshot['uid'] as String,
      email: snapshot['email'] as String,
      bio: snapshot['bio'] as String,
      followers: snapshot['followers'] as List,
      following: snapshot['following'] as List,
      photoUrl: snapshot['photoUrl'] as String,
    );
  }
}
