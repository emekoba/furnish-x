import 'package:flutter/material.dart';
import 'package:furnish_x/furnish_x/couch_preview.dart';
import 'package:furnish_x/globals/app_data.dart';
import 'package:furnish_x/widgets/post.dart';
import 'package:furnish_x/widgets/search_bar.dart';
import 'package:furnish_x/widgets/top_tab_bar.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _changeCategory(name) {}

  @override
  Widget build(BuildContext context) {
    final _app_data = Get.put(AppData());

    _previewCouch(id) {
      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   builder: (context) => Container(
      //     color: Colors.red,
      //   ),
      // );

      Get.to(CouchPreview(id: id));
    }

    _addToFavorites(id) {
      _app_data.addToFavorites(id);
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Best Furniture",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  fontWeight: FontWeight.w900, fontSize: 30)),
                      const SizedBox(height: 10),
                      Text("Perfect Choice!",
                          style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 30),
                      SearchBar(onChange: () {}),
                      const SizedBox(height: 30),
                      TopTabBar(
                        tabs: const ["All", "Chair", "Table", "Lamp", "Floor"],
                        changeTab: _changeCategory,
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                          child: GetBuilder(
                              init: AppData(),
                              builder: (ctx) {
                                return ListView(
                                    children: _app_data.posts.keys
                                        .map((e) => Post(
                                              id: e,
                                              key: Key(e.toString()),
                                              onTap: _previewCouch,
                                              addToFavorites: _addToFavorites,
                                              favorite: _app_data.posts[e]
                                                  ["favorite"],
                                              name: _app_data.posts[e]["name"],
                                              creator: _app_data.posts[e]
                                                  ["creator"],
                                              image: _app_data.posts[e]
                                                  ["image"],
                                              price: _app_data.posts[e]
                                                  ["price"],
                                              description: _app_data.posts[e]
                                                  ["description"],
                                            ))
                                        .toList());
                              }))
                    ]))));
  }
}
