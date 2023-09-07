import 'package:flutter/cupertino.dart';
import '../models/post_model.dart';

Widget itemOfPost(Post post) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.id.toString()),
        Text(post.title.toString().toUpperCase()),
        SizedBox(
          height: 5,
        ),
        Text(post.body.toString()),
      ],
    ),
  );
}