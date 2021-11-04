import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CouchPreview extends StatelessWidget {
  dynamic data;

  CouchPreview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Expanded(
          child: Stack(children: [
        Image(
            width: double.infinity,
            image: AssetImage(data["image"]),
            fit: BoxFit.cover),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(Icons.keyboard_arrow_left_rounded,
                              size: 35))),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Icon(FontAwesomeIcons.solidHeart,
                          size: 20, color: Colors.redAccent))
                ])),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                height: (MediaQuery.of(context).size.height / 2) + 50,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data["name"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(fontSize: 25)),
                              const SizedBox(height: 10),
                              Text(data["creator"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          fontSize: 15, color: Colors.grey)),
                              const SizedBox(height: 25),
                              Text(data["description"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          height: 1.8)),
                            ])
                      )),
                      Container(
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor))),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "\$${data["price"]}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontSize: 30,
                                                fontWeight: FontWeight.w900,
                                                color: const Color(0xff403B58)),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: " .00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900,
                                                  color:
                                                      const Color(0xff403B58)))
                                    ])),
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                        width: 150,
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.redAccent,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text("Buy now",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                    fontSize: 14,
                                                    color: Colors.white))))
                              ]))
                    ])))
      ])),
    ])));
  }
}
