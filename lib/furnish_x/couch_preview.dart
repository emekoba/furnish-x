import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furnish_x/globals/app_data.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CouchPreview extends StatelessWidget {
  int id;

  CouchPreview({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _app_data = Get.put(AppData());

    _addToFavorites() {
      _app_data.addToFavorites(id);
    }

    return Scaffold(
        body: SafeArea(
            child: GetBuilder(
                init: AppData(),
                builder: (ctx) {
                  return Column(children: [
                    Expanded(
                        child: Stack(children: [
                      Image(
                          width: double.infinity,
                          image: AssetImage(_app_data.posts[id]["image"]),
                          fit: BoxFit.cover),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Icon(
                                            Icons.keyboard_arrow_left_rounded,
                                            size: 35))),
                                InkWell(
                                    onTap: _addToFavorites,
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Icon(
                                            _app_data.posts[id]["favorite"]
                                                ? FontAwesomeIcons.solidHeart
                                                : FontAwesomeIcons.heart,
                                            size: 20,
                                            color: Colors.redAccent)))
                              ])),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                              height:
                                  (MediaQuery.of(context).size.height / 2) + 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35))),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 50, horizontal: 30),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      _app_data.posts[id]
                                                          ["name"],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          ?.copyWith(
                                                              fontSize: 25)),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      _app_data.posts[id]
                                                          ["creator"],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          ?.copyWith(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey)),
                                                  const SizedBox(height: 25),
                                                  Text(
                                                      _app_data.posts[id]
                                                          ["description"],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          ?.copyWith(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey,
                                                              height: 1.8)),
                                                ]))),
                                    Container(
                                        height: 80,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    width: 1,
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "\$${_app_data.posts[id]["price"]}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          ?.copyWith(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                              color: const Color(
                                                                  0xff403B58)),
                                                      children: <TextSpan>[
                                                    TextSpan(
                                                        text: " .00",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6
                                                            ?.copyWith(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                color: const Color(
                                                                    0xff403B58)))
                                                  ])),
                                              InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 150,
                                                      height: 50,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.redAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Text("Buy now",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline6
                                                              ?.copyWith(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white))))
                                            ]))
                                  ])))
                    ])),
                  ]);
                })));
  }
}
