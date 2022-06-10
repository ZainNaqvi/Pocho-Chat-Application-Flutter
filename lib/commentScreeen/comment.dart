import 'package:flutter/material.dart';
import 'package:pocho_project/commentScreeen/components/commentsCart.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/login/components/suffixIcon.dart';
import 'package:pocho_project/resources/firestoreMethods.dart';
import 'package:pocho_project/widgets/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';

class CommentScreen extends StatefulWidget {
  final snap;
  const CommentScreen({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentTextEditingController =
      TextEditingController();
  bool isPostedComment = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        text: "Comment",
        color: Colors.white,
        press: () {
          Navigator.of(context).pop();
        },
        context: context,
      ),
      body: CommentsCart(),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.w,
            ),
            child: Column(
              children: [
                isPostedComment
                    ? LinearProgressIndicator(
                        color: Colors.white,
                      )
                    : Padding(padding: EdgeInsets.zero),
                Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        widget.snap["profileImage"],
                      ),
                      radius: 25,
                      backgroundColor: darkColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: TextField(
                          controller: _commentTextEditingController,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isPostedComment = true;
                                });
                                String res =
                                    await FirestoreMethods().postComments(
                                  uid: widget.snap['uid'],
                                  postId: widget.snap['postId'],
                                  text: _commentTextEditingController.text,
                                  profilePic: widget.snap['profileImage'],
                                  username: widget.snap["userName"],
                                );

                                setState(() {
                                  isPostedComment = false;
                                });
                                showSnakeBar(res, context);
                              },
                              child: suffixicon(
                                icon: Icons.send,
                              ),
                            ),
                            fillColor: Color.fromARGB(255, 199, 205, 211),
                            filled: true,
                            enabledBorder: outlineborder(),
                            border: outlineborder(),
                            focusedBorder: outlineborder(),
                            hintText: "Enter your reply...",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outlineborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      gapPadding: 4,
    );
  }
}
