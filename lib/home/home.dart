import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocho_project/constants.dart';
import 'package:pocho_project/home/components/body.dart';
import 'package:pocho_project/home/global_variables.dart';
import 'package:pocho_project/providers/userProviders.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    pageController = PageController();
  }

  addData() async {
    UserProviders _userProviders = Provider.of(context, listen: false);
    await _userProviders.refreshUser();
  }

  // creating the page controlller
  late PageController pageController;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int _page = 0;
  selectedTab(int selectedPage) {
    pageController.jumpToPage(selectedPage);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: items,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        height: 70.sp,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: _page == 0 ? 35 : 30,
              color: _page == 0 ? Colors.white : Colors.grey,
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: _page == 1 ? 35 : 30,
              color: _page == 1 ? Colors.white : Colors.grey,
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              size: _page == 2 ? 35 : 30,
              color: _page == 2 ? Colors.white : Colors.grey,
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: _page == 3 ? 35 : 30,
              color: _page == 3 ? Colors.white : Colors.grey,
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: _page == 4 ? 35 : 30,
              color: _page == 4 ? Colors.white : Colors.grey,
            ),
            label: "",
            backgroundColor: Colors.white,
          ),
        ],
        onTap: selectedTab,
      ),
    );
  }
}
