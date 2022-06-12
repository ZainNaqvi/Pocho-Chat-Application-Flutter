import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pocho_project/feedScreen/components/appbarActions.dart';
import 'package:pocho_project/feedScreen/components/appbarTitle.dart';
import 'package:pocho_project/feedScreen/components/postcard.dart';
import 'package:pocho_project/login/login_screen.dart';
import 'package:pocho_project/resources/auth_user.dart';
import 'package:pocho_project/widgets/customSnakeBar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    bool signingOut = false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leadingWidth: 0,
          leading: Container(),
          title: appbarTitle(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: appbarActions(
                press: () async {
                  setState(() {
                    signingOut = true;
                  });
                  String res = await AuthUser().signOut();

                  setState(() {
                    signingOut = false;
                  });
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                  showSnakeBar(res, context);
                },
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("posts")
              .orderBy(
                'datePublished',
                descending: true,
              )
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            return signingOut
                ? LinearProgressIndicator(
                    color: Colors.white,
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) => PostCardPage(
                      snap: snapshot.data!.docs[index].data(),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
