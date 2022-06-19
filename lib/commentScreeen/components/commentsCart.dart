import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocho_project/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:pocho_project/resources/firestoreMethods.dart';
import 'package:provider/provider.dart';

class CommentsCart extends StatefulWidget {
  final snap;
  const CommentsCart({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsCart> createState() => _CommentsCartState();
}

class _CommentsCartState extends State<CommentsCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserCreaditials user = Provider.of<UserProviders>(context).getUser;
    String likes = widget.snap['likes'].length.toString();
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 2.0,
                color: Colors.grey.withOpacity(0.1),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0.h),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: darkColor,
                      backgroundImage: NetworkImage(
                        widget.snap['profileImage'],
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Text(
                            "@${widget.snap['userName']}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: Text(
                      DateFormat.yMMMd().format(
                        widget.snap["datePublished"].toDate(),
                      ),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "${widget.snap['comment']}",
                            style: TextStyle(
                              fontSize: 15.sp,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await FirestoreMethods().likePostComment(
                                    postId: widget.snap['postId'],
                                    commentId: widget.snap['commentsId'],
                                    uid: widget.snap['uid'],
                                    like: widget.snap['likes']);
                              },
                              icon: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                  ),
                                  Positioned(
                                      bottom: -16.h,
                                      left: 10,
                                      child: Text("${likes}")),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment_outlined,
                              ),
                            ),
                            user.uid == widget.snap['uid']
                                ? IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
