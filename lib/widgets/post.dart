import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Post extends StatelessWidget {
  int id;
  String image;
  String name;
  String creator;
  String description;
  String price;
  bool favorite;
  Function onTap;
  Function addToFavorites;

  Post(
      {Key? key,
      required this.id,
      required this.image,
      required this.favorite,
      required this.creator,
      required this.onTap,
      required this.addToFavorites,
      required this.price,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(id),
      child: Container(
          height: 230,
          margin: const EdgeInsets.only(bottom: 40),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(children: [
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(image: AssetImage(image))),
              Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () => addToFavorites(id),
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(
                            favorite
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            size: 15,
                            color: Colors.redAccent)),
                  ))
            ]),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 25)),
                          const SizedBox(height: 10),
                          Text(creator,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 15, color: Colors.grey)),
                          const SizedBox(height: 25),
                          Expanded(
                              child: Text(description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          height: 1.8))),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: price,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w900,
                                                color: const Color(0xff403B58)),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: " .00",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                  color:
                                                      const Color(0xff403B58)))
                                    ])),
                                InkWell(
                                    onTap: () {},
                                    child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            22, 5, 22, 10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff403B58),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text("Buy",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    height: 1.8))))
                              ])
                        ])))
          ])),
    );
  }
}
