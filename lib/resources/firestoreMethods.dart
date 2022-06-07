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
}
