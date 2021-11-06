import 'package:get/get.dart';

class AppData extends GetxController {
  final Map<int, dynamic> _posts = {
    0: <String, dynamic>{
      "name": "Irul Chair",
      "image": "lib/resources/images/chair1.jpg",
      "creator": "Seto",
      "description": "Ergonomical for humans body curve",
      "price": "102",
      "favorite": false
    },
    1: <String, dynamic>{
      "name": "Malik Chair",
      "image": "lib/resources/images/chair2.jpg",
      "creator": "Malik",
      "description": "Ergonomical for humans body curve",
      "price": "102",
      "favorite": false
    },
    2: <String, dynamic>{
      "name": "Seto Chair",
      "image": "lib/resources/images/chair3.jpg",
      "creator": "Malik",
      "description": "Ergonomical for humans body curve",
      "price": "102",
      "favorite": false
    },
    // "chair_4": <String, String>{
    //   "image": "lib/resources/images/chair4.jpg",
    //   "creator": "Malik",
    //   "description": "Ergonomical for humans body curve",
    //   "price": "102",
    //   "favorite":false
    // },
    // "chair_5": <String, String>{
    //   "image": "lib/resources/images/chair5.jpg",
    //   "creator": "Malik",
    //   "description": "Ergonomical for humans body curve",
    //   "price": "102",
    //   "favorite":false
    // },
  };

  Map get posts => _posts;

  void addToFavorites(id) {
    _posts[id]["favorite"] = !_posts[id]["favorite"];

    update();
  }
}
