import 'package:flutter/material.dart';
import 'package:pattern_provider/viewmodels/createview_model.dart';
import 'package:pattern_provider/viewmodels/updateview_model.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../views/createview.dart';

class UpdatePage extends StatefulWidget {
  static final String id = "update_page";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdatePageModel updatePageModel = UpdatePageModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post("acds", 1, "12cas", 1);
    updatePageModel.apiPostList();
    updatePageModel.apiPostUpdate(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update Page"),
          backgroundColor: Colors.blue,
        ),
        body: ChangeNotifierProvider(
          create: (context) => updatePageModel,
          child: Consumer<UpdatePageModel>(
            builder: (ctx, model, index) => Stack(
              children: [
                updatePageModel.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox.shrink(),
                ListView.builder(
                  itemCount: updatePageModel.items.length,
                  itemBuilder: (ctx, index) {
                    Post post = updatePageModel.items[index];
                    return itemOfPost( updatePageModel! as CreatePageModel, post);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
