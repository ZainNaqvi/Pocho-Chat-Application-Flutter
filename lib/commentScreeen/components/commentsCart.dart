import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocho_project/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:provider/provider.dart';

class CommentsCart extends StatefulWidget {
  final snap;
  const CommentsCart({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsCart> createState() => _CommentsCartState();
}

class _CommentsCartState extends State<CommentsCart> {
  @override
  Widget build(BuildContext context) {
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
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.comment_outlined,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
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
