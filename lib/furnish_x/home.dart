import 'package:flutter/material.dart';
import 'package:furnish_x/furnish_x/couch_preview.dart';
import 'package:furnish_x/globals/app_data.dart';
import 'package:furnish_x/widgets/post.dart';
import 'package:furnish_x/widgets/search_bar.dart';
import 'package:furnish_x/widgets/top_tab_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _changeCategory(name) {}

  @override
  Widget build(BuildContext context) {
    AppData _app_data = AppData();

    _previewCouch(couchData) {
      // showModalBottomSheet(
      //   context: context,
      //   isScrollControlled: true,
      //   builder: (context) => Container(
      //     color: Colors.red,
      //   ),
      // );

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CouchPreview(data: couchData)));
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
                      const SearchBar(),
                      const SizedBox(height: 30),
                      TopTabBar(
                        tabs: const ["All", "Chair", "Table", "Lamp", "Floor"],
                        changeTab: _changeCategory,
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                          child: ListView(
                              children: _app_data.posts.keys
                                  .map((e) => Post(
                                      onTap: _previewCouch,
                                      favorite: true,
                                      name: e,
                                      creator: _app_data.posts[e]["creator"],
                                      image: _app_data.posts[e]["image"],
                                      price: _app_data.posts[e]["price"],
                                      description: _app_data.posts[e]
                                          ["description"]))
                                  .toList()))
                    ]))));
  }
}
