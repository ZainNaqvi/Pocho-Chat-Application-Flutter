import 'package:flutter/material.dart';
import 'package:pocho_project/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pocho_project/model/users.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:provider/provider.dart';

class CommentsCart extends StatefulWidget {
  const CommentsCart({Key? key}) : super(key: key);

  @override
  State<CommentsCart> createState() => _CommentsCartState();
}

class _CommentsCartState extends State<CommentsCart> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      children: [
                        Text("fullname"),
                        SizedBox(
                          width: 5,
                        ),
                        Text("@username"),
                      ],
                    ),
                  ),
                  trailing: Text("78/34/34"),
                  subtitle: Column(
                    children: [
                      Text(
                        "dfdsf sdf s dfd sf ad fds f dsf ds f dsf dsf sd f dsf d",
                        style: TextStyle(
                          fontSize: 15.sp,
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
                              Icons.share_outlined,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.download_outlined),
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
    );
  }
}
