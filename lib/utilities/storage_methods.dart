import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethodFirebase {
  // creating the instance of the firebase storage here...
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  // creating the instance of the firebase auth here....
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // add image to the firebase storage here..
  Future<String> uploadImageToStorage({
    required String childName,
    required Uint8List file,
    required bool isPost,
  }) async {
    Reference reference = _firebaseStorage
        .ref()
        .child(childName)
        .child(_firebaseAuth.currentUser!.uid);
    // for the uploading picture to the firebase storage we have
    UploadTask uploadTask = reference.putData(file);
    TaskSnapshot snap = await uploadTask;
    // downloading process
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }
}
