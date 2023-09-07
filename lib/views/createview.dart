import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/viewmodels/createview_model.dart';

import '../models/post_model.dart';

Widget itemOfPost(CreatePageModel createPageModel,Post post){
  return  Container(
    padding: EdgeInsets.only(left: 20,right: 20,top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5,),
        Text(post.id.toString()),
        Text(post.body.toString()),
      ],
    ),
  );
}