import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPost {
  final String description;
  final String uid;
  final String userName;
  final String postId;
  final datePublished;
  final String postURL;
  final String profileImage;
  final String fullName;
  final likes;
  // creating the constructor here...
  UserPost(
      {required this.description,
      required this.uid,
      required this.userName,
      required this.postId,
      required this.datePublished,
      required this.postURL,
      required this.profileImage,
      required this.likes,
      required this.fullName});
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        "description": description,
        "userName": userName,
        "fullName": fullName,
        "postId": postId,
        "uid": uid,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "likes": likes,
        "postURL": postURL,
      };
  static UserPost fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserPost(
      uid: snapshot['uid'],
      userName: snapshot['userName'],
      description: snapshot['description'],
      profileImage: snapshot['profileImage'],
      likes: snapshot['likes'],
      datePublished: snapshot['datePublished'],
      postURL: snapshot['postURL'],
      postId: snapshot['postId'],
      fullName: snapshot['fullName'],
    );
  }
}
