import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/widgets/customOutlineBorder.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchEditingController.dispose();
  }

  bool isShowUser = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextFormField(
            controller: searchEditingController,
            decoration: InputDecoration(
              hintText: "Search user here....",
              border: outlineCustomBorder(),
              enabledBorder: outlineCustomBorder(),
              focusedBorder: outlineCustomBorder(),
            ),
            onFieldSubmitted: (String _) {
              print(_);
              setState(() {
                isShowUser = true;
              });
            },
          ),
        ),
        body: isShowUser
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where(
                      'userName',
                      isGreaterThanOrEqualTo: searchEditingController.text,
                    )
                    .get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            snapshot.data!.docs[index]['photoURL'],
                          ),
                        ),
                        title: Text(
                          (snapshot.data! as dynamic).docs[index]['userName'],
                        ),
                        subtitle: Text(
                          (snapshot.data! as dynamic).docs[index]['bio'],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      );
                    },
                  );
                },
              )
            : FutureBuilder(
                future: FirebaseFirestore.instance.collection('users').get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LinearProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        child: ListTile(
                          title: Text(
                            snapshot.data!.docs[index]['userName'],
                          ),
                          subtitle: Text(
                            snapshot.data!.docs[index]['bio'],
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              snapshot.data!.docs[index]['photoURL'],
                            ),
                          ),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
