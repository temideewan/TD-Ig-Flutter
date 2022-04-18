import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/models/user.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  late PageController pageController;
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        body: PageView(
          children: const [
            Center(
              child: Text("Feed"),
            ),
            Center(
              child: Text("search"),
            ),
            Center(
              child: Text("add post"),
            ),
            Center(
              child: Text("notifications"),
            ),
            Center(
              child: Text("profile"),
            ),
          ],
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
            backgroundColor: mobileBackgroundColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                      color: _page == 0 ? primaryColor : secondaryColor),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search,
                      color: _page == 1 ? primaryColor : secondaryColor),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle,
                      color: _page == 2 ? primaryColor : secondaryColor),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,
                      color: _page == 3 ? primaryColor : secondaryColor),
                  label: '',
                  backgroundColor: primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      color: _page == 4 ? primaryColor : secondaryColor),
                  label: '',
                  backgroundColor: primaryColor),
            ],
            onTap: navigationTapped));
  }
}
