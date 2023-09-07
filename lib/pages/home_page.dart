import 'package:flutter/material.dart';
import 'package:pattern_provider/viewmodels/homeview_model.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../views/homeview.dart';
import 'create_page.dart';
class HomePage extends StatefulWidget {
  static final String id ="home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        backgroundColor: Colors.blue,
      ),
      body:ChangeNotifierProvider(
        create: (context) => viewModel,
        child:Consumer<HomeViewModel>(
          builder:(ctx, model,index)=>Stack(
            children: [
              viewModel.isLoading? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
              ListView.builder(
                itemCount: viewModel.items.length,

                itemBuilder: ( ctx,index){
                  Post post = viewModel.items[index];
                  return itemOfPost(viewModel,post);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, CreatePage.id);
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,

        child: const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}
