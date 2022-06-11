import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocho_project/commentScreeen/comment.dart';
import 'package:pocho_project/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/resources/firestoreMethods.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';
import 'package:pocho_project/widgets/likeAnimation.dart';
import 'package:provider/provider.dart';

class PostCardPage extends StatefulWidget {
  final snap;
  const PostCardPage({Key? key, required this.snap}) : super(key: key);

  @override
  State<PostCardPage> createState() => _PostCardPageState();
}

class _PostCardPageState extends State<PostCardPage> {
  bool isLikeAnimating = false;
  int noOfComments = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }

  void getComments() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .doc(widget.snap['postId'])
          .collection('comments')
          .get();
      noOfComments = snapshot.docs.length;
      setState(() {});
    } catch (e) {
      showSnakeBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserCreaditials _user = Provider.of<UserProviders>(context).getUser;
    bool isDeleting = false;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: darkColor,
                  backgroundImage: NetworkImage(widget.snap["profileImage"]),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.snap["fullName"],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "@${widget.snap["userName"]}",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            elevation: 3,
                            duration: Duration(seconds: 2),
                            content: Container(
                              height: 150.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _user.uid == widget.snap['uid']
                                      ? custombutton(
                                          press: () async {
                                            setState(() {
                                              isDeleting = true;
                                            });
                                            String res =
                                                await FirestoreMethods()
                                                    .deletePost(
                                              postId: widget.snap['postId'],
                                            );
                                            setState(() {
                                              isDeleting = false;
                                            });
                                            showSnakeBar(res, context);
                                          },
                                          text: 'Delete')
                                      : isDeleting
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            )
                                          : Container(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  custombutton(press: () {}, text: 'Report'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  custombutton(
                                      press: () {
                                        setState(() {});
                                      },
                                      text: 'Cancel'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .closed;
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // image sections
            SizedBox(
              height: 15,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.emoji_emotions),
                      SizedBox(
                        width: 5,
                      ),
                      Text(":)"),
                    ],
                  ),
                  Text(
                    widget.snap['description'],
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  noOfComments == 0
                      ? Text(
                          "No comment on post yet! ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      : Text(
                          "View all ${noOfComments} comments ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat.yMMMd().format(
                      widget.snap['datePublished'].toDate(),
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onDoubleTap: () async {
                setState(() {
                  isLikeAnimating = true;
                });
                await FirestoreMethods().likePost(
                  like: widget.snap['likes'],
                  postId: widget.snap["postId"],
                  uid: _user.uid,
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.snap!["postURL"],
                        ),
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1),
                    opacity: isLikeAnimating ? 1 : 0,
                    child: LikeAnimation(
                      child: Icon(
                        Icons.favorite,
                        size: 140,
                        color: Colors.white,
                      ),
                      isAnimating: isLikeAnimating,
                      duration: Duration(
                        milliseconds: 400,
                      ),
                      onEnd: () {
                        setState(() {
                          isLikeAnimating = false;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      noOfComments == 0
                          ? Text(
                              "No comment on post yet! ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CommentScreen(snap: widget.snap),
                                  ),
                                );
                              },
                              child: Text(
                                "View all ${noOfComments} comments ",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_outline_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${widget.snap["likes"].length} Likes",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LikeAnimation(
                  smallLike: true,
                  isAnimating: widget.snap["likes"].contains(_user.uid),
                  child: IconButton(
                    onPressed: () async {
                      await FirestoreMethods().likePost(
                          postId: widget.snap['postId'],
                          uid: _user.uid,
                          like: widget.snap['likes']);
                    },
                    icon: widget.snap["likes"].contains(_user.uid)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_outline,
                          ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CommentScreen(
                          snap: widget.snap,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.comment_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.download_outlined),
                ),
              ],
            ),

            // details of teh post here...
          ],
        ),
      ),
    );
  }

  TextButton custombutton({
    required String text,
    required VoidCallback press,
  }) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(500, 50),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.black.withOpacity(0.04),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
