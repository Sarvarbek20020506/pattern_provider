
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CreatePageModel extends ChangeNotifier{

  bool isLoading = false;
  List<Post> items = [];

  Future apiPostCreate() async {
    try {
      final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post as Post ));

      if (response != null) {
        LogService.w(response);
        Post.fromJson(jsonDecode(response.toString())) as List<Post>;
        LogService.d("ishladi");
      } else {
        LogService.e("api ishlamadi");
      }
    } catch (e) {
      LogService.e("Xatolik: $e");
    }
  }


  Future apiPostList()async{
    isLoading = true;
    notifyListeners();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    isLoading = false;
    if(response !=null){
      items= Network.parsePostList(response);
    }else{
      items =[];
    }
    notifyListeners();
  }
}