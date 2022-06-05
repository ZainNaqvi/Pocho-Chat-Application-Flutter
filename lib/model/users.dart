import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCreaditials {
  final String bio;
  final String fullName;
  final String uid;
  final String userName;
  final String profilePic;
  final List followers;
  final List following;
  // creating the constructor here...
  UserCreaditials({
    required this.bio,
    required this.uid,
    required this.fullName,
    required this.profilePic,
    required this.userName,
    required this.followers,
    required this.following,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "userName": userName,
        "bio": bio,
        "uid": uid,
        "followers": [],
        "following": [],
        "photoURL": profilePic,
      };
  static UserCreaditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreaditials(
      bio: snapshot['bio'],
      uid: snapshot['uid'],
      fullName: snapshot['fullName'],
      profilePic: snapshot['photoURL'],
      userName: snapshot['userName'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
