import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopTabBar extends StatefulWidget {
  TopTabBar(
      {Key? key,
      this.flexException,
      required this.tabs,
      required this.changeTab,
      this.control,
      this.currentIndex})
      : super(key: key);

  TopTabBar.icon(
      {Key? key,
      this.flexException,
      required this.tabs,
      required this.changeTab,
      this.control,
      this.currentIndex})
      : super(key: key) {
    isIcon = true;
  }

  int? currentIndex;
  bool? isIcon = false;
  bool? flexException = false;
  List tabs;
  Function? changeTab;
  final PageController? control;

  @override
  _TopTabBarState createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  final Map<String, bool> _tabs = {};
  bool flex = false;

  void _selectTab(String name) {
    setState(() {
      _tabs.forEach((key, value) {
        if (key != name) {
          _tabs[key] = false;
        }
      });
      _tabs[name] = true;
    });

    widget.changeTab!(name);
  }

  @override
  void initState() {
    super.initState();

    int x = 0;

    setState(() {
      if (widget.tabs.length > 4 && !widget.isIcon!) {
        flex = true;
      }

      for (String each in widget.tabs) {
        _tabs[each] = x == 0 ? true : false;
        x++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: flex == true
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: _tabs.entries
                        .map((e) => Bar(flex, e.key, e.value, _selectTab))
                        .toList()))
            : Row(
                children: _tabs.entries
                    .map((e) => Bar(flex, e.key, e.value, _selectTab))
                    .toList()));
  }
}

// ignore: must_be_immutable
class Bar extends StatelessWidget {
  const Bar(this.flex, this.value, this.active, this.selectTab, {Key? key})
      : super(key: key);

  final bool flex;
  final dynamic value;
  final bool active;
  final Function selectTab;

  @override
  Widget build(BuildContext context) {
    return flex != true
        ? Expanded(
            child: GestureDetector(
                onTap: () => selectTab(value),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                        color: active
                            ? const Color(0xffF6F6F6)
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Center(
                        child: Text(value,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    fontSize: 10,
                                    color: active
                                        ? Colors.black
                                        : Colors.white))))))
        : GestureDetector(
            onTap: () => selectTab(value),
            child: AnimatedContainer(
                margin: const EdgeInsets.only(right: 30),
                duration: const Duration(milliseconds: 300),
                constraints: const BoxConstraints(minWidth: 60),
                decoration: BoxDecoration(
                    color:
                        active ? const Color(0xff403B58) : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Text(value,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color:
                              active ? Colors.white : const Color(0xff403B58))),
                )));
  }
}
