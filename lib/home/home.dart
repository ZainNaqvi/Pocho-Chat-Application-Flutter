import 'package:flutter/material.dart';
import 'package:pocho_project/home/components/body.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProviders _userProviders = Provider.of(context, listen: false);
    await _userProviders.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
