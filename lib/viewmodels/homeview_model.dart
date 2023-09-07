import 'package:flutter/cupertino.dart';
import '../models/post_model.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier{
  bool isLoading = false;
  List<Post> items = [];

   Future apiPostList()async{
     isLoading = true;
     notifyListeners();

     var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
     //LogService.w(response.toString());
     isLoading = false;
     notifyListeners();
     if(response != null){
       items= Network.parsePostList(response);
     }else{
       items =[];
     }

     notifyListeners();
  }

  Future<bool> apiPostDelete(Post post)async{
    isLoading = true;
    var response = await Network.DEL(Network.API_DEL+post.id.toString(), Network.paramsEmpty());

    isLoading = false;
    apiPostList();
    notifyListeners();
    return response !=null;
  }
}