import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius _border_radius = BorderRadius.circular(12);

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: Container(
                  height: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: _border_radius),
                  child: Row(children: const [
                    Icon(Icons.search),
                    // TextField(),
                  ]))),
          const SizedBox(width: 30),
          Container(
              width: 45,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: _border_radius),
              child: const Icon(Icons.filter_list_sharp)),
        ],
      ),
    );
  }
}
