class UserCreaditials {
  String email;
  String password;
  String bio;
  String fullName;
  String uid;
  String userName;
  String profilePic;
  List followers;
  List following;
  // creating the constructor here...
  UserCreaditials({
    required this.bio,
    required this.uid,
    required this.email,
    required this.password,
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
}
