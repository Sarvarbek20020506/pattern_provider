import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class UpdatePageModel extends ChangeNotifier{

  bool isLoading = false;
  List<Post> items = [];

  Future apiPostUpdate(Post post) async {
    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
      LogService.i(response.toString()),
      if (response != null)
        {
         Post.fromJson(jsonDecode(response.toString())) as List<Post>,
        }
      else
        {
          items = [],
        }
    });
    notifyListeners();
  }


  Future apiPostList() async {
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading = false;
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    notifyListeners();
  }


}