import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/profile/components/fullImage.dart';
import 'package:pocho_project/widgets/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userData = {};
  int postsLength = 0;
  int followers = 0;
  int followings = 0;
  bool isProfileLoading = false;
  bool isFollowing = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      setState(() {
        isProfileLoading = true;
      });
      var snapData = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();
      setState(() {
        isProfileLoading = true;
      });
      var postsData = await FirebaseFirestore.instance
          .collection('posts')
          .where(
            'uid',
            isEqualTo: widget.uid,
          )
          .get();

      postsLength = postsData.docs.length;
      userData = snapData.data()!;
      followers = snapData.data()!['followers'].length;
      followings = snapData.data()!['following'].length;
      isFollowing = snapData.data()!['following'].contains(
            FirebaseAuth.instance.currentUser!.uid,
          );
      setState(() {
        isProfileLoading = false;
      });
    } catch (e) {
      showSnakeBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.black,
        body: isProfileLoading
            ? LinearProgressIndicator(
                color: Colors.white,
              )
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            userData['photoURL'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 400.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            color: Colors.black.withOpacity(
                              0.4,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10.w,
                          bottom: -50.h,
                          child: Container(
                            child: InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ShowFULLImage(
                                    imageURL: userData['photoURL'],
                                  ),
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 50.h,
                                backgroundColor: darkColor,
                                backgroundImage: NetworkImage(
                                  userData['photoURL'],
                                ),
                              ),
                            ),
                          ),
                        ),
                        FirebaseAuth.instance.currentUser!.uid == widget.uid
                            ? Positioned(
                                left: 130.w,
                                bottom: -50.w,
                                child: Container(
                                  width: 200.w,
                                  height: 30.h,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : isFollowing
                                ? Positioned(
                                    left: 130.w,
                                    bottom: -50.w,
                                    child: Container(
                                      width: 200.w,
                                      height: 30.h,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Un Follow",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Positioned(
                                    left: 130.w,
                                    bottom: -50.w,
                                    child: Container(
                                      width: 200.w,
                                      height: 30.h,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                      ],
                    ),
                    SizedBox(
                      height: 90.h,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("$followers"),
                          Text("$followings"),
                          Text("$postsLength"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Followers"),
                          Text("Following"),
                          Text("Posts"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 5.h,
                      ),
                      child: Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "${userData["fullName"]} @${userData['userName']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${userData["bio"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.w,
                        vertical: 5.h,
                      ),
                      child: Expanded(
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
