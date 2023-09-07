import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pattern_provider/viewmodels/createview_model.dart';
import 'package:provider/provider.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';
import '../views/createview.dart';
class CreatePage extends StatefulWidget {
  static final String id ="create_page";
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreatePageModel createPageModel = CreatePageModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //var  post = Post("acds", 1,"12cas", 1);
    createPageModel.apiPostList();
    createPageModel.apiPostCreate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Page"),
        backgroundColor: Colors.blue,
      ),
      body: ChangeNotifierProvider(
        create: (context) => createPageModel,
        child: Consumer<CreatePageModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              createPageModel.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox.shrink(),
              ListView.builder(
                itemCount: createPageModel.items.length,
                itemBuilder: (ctx, index) {
                  Post post = createPageModel.items[index];
                  return itemOfPost(createPageModel, post);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}