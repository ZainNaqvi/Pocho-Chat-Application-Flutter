import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pocho_project/model/posts.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/utilities/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // for uploading the image
  Future<String> uploadPost({
    required Uint8List file,
    required String description,
    required String uid,
    required String userName,
    required String profileImage,
    required String fullName,
  }) async {
    String res = "Some error occured";
    try {
      String imageURL =
          await StorageMethods().uploadImageToStorage("posts", file, true);
      ;
      String postId = const Uuid().v1();
      UserPost userPost = UserPost(
        description: description,
        uid: uid,
        userName: userName,
        fullName: fullName,
        postId: postId,
        datePublished: DateTime.now(),
        postURL: imageURL,
        profileImage: profileImage,
        likes: [],
      );
      _firebaseFirestore.collection("posts").doc(postId).set(userPost.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // for liking the post
  Future<void> likePost({
    required String postId,
    required String uid,
    required List like,
  }) async {
    try {
      if (like.contains(uid)) {
        await _firebaseFirestore.collection("posts").doc(postId).update(
          {
            "likes": FieldValue.arrayRemove([uid]),
          },
        );
      } else {
        await _firebaseFirestore.collection("posts").doc(postId).update(
          {
            "likes": FieldValue.arrayUnion([uid]),
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // post comments
  Future<String> postComments({
    required String uid,
    required String postId,
    required String text,
    required String profilePic,
    required String username,
  }) async {
    String res = "Some error Occured";
    try {
      if (text.isEmpty) {
        res = "Please fill the comment";
      } else {
        String commentsId = Uuid().v1();
        await _firebaseFirestore
            .collection('posts')
            .doc(postId)
            .collection("comments")
            .doc(commentsId)
            .set({
          "uid": uid,
          "postId": postId,
          "userName": username,
          "datePublished": DateTime.now(),
          "profileImage": profilePic,
          "comment": text,
        });
        res = "The comment is posted successfully.";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  // deleting the post
  Future<String> deletePost({required String postId}) async {
    String res = "Some error occured";
    try {
      await _firebaseFirestore.collection('posts').doc(postId).delete();
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
