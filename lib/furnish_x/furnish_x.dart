import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnish_x/furnish_x/home.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class FurnishX extends StatefulWidget {
  const FurnishX({Key? key}) : super(key: key);

  @override
  State<FurnishX> createState() => _FurnishXState();
}

class _FurnishXState extends State<FurnishX> with TickerProviderStateMixin {
  TabController? _tabController;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  _changePage(index) {
    setState(() {
      _tabController?.index = index;
    });

    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const Home(),
              Container(),
              Container(),
              Container(),
            ]),
        bottomNavigationBar: MotionTabBar(
          labels: const ["Home", "Cart", "Favorites", "Profile"],
          initialSelectedTab: "Home",
          tabIconColor: Colors.grey,
          // const Color(0xffEEEDF0),
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value) => _changePage(value),
          icons: const [
            Icons.home,
            Icons.card_travel,
            Icons.star,
            Icons.person
          ],
          tabIconSize: 30,
          textStyle:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ));
  }
}
