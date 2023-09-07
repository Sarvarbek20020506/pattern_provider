import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_provider/pages/update_page.dart';
import 'package:pattern_provider/viewmodels/homeview_model.dart';

import '../models/post_model.dart';

Widget itemOfPost(HomeViewModel viewModel, Post post){
  return Slidable(
    key: UniqueKey(),
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: (){},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            Navigator.pushReplacementNamed(context, UpdatePage.id);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(

        onDismissed: (){
          viewModel.apiPostDelete(post as Post);
        },
      ),
      children: [
        SlidableAction(onPressed: (BuildContext context){
          viewModel.apiPostDelete(post);
        },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(post.id.toString()),
          Text(post.title.toString().toUpperCase()),
          SizedBox(height: 5,),
          Text(post.body.toString()),
          Text("chopar"),
        ],
      ),
    ),
  );
}