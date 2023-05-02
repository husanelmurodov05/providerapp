import 'package:flutter/material.dart';

import '../model/Post.dart';
import '../services/api_services.dart';

class CreatePageViewModel extends ChangeNotifier {
  final TextEditingController bodyC = TextEditingController();
  final TextEditingController titleC = TextEditingController();
  bool isLoading = false;
  createPost(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    Post post = Post(userId: 1, id: 1, title: bodyC.text, body: titleC.text);
    ApiServices.createPost(post).then((value) {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value.title!)));
    });
  }

  updatePost(BuildContext context) {
    isLoading = true;
    notifyListeners();
    Post post = Post(userId: 11, id: 11, title: bodyC.text, body: titleC.text);
    ApiServices.putPost(post).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Yangilandi${value.title!}')));
      isLoading = false;
      notifyListeners();
      //Navigator.pop(context);
    });
  }
}
