

import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/APIs/home_service.dart';
import 'package:tinker_bootcamp_app/Models/home_model.dart';
import 'package:tinker_bootcamp_app/Screens/Home/widgets/grid_post.dart';
import 'package:tinker_bootcamp_app/Screens/Home/widgets/hero_banner.dart';
import 'package:tinker_bootcamp_app/Screens/Home/widgets/row_posts.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder<List<HomeData>>(
        future: getHomeData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'),);
          }else if(snapshot.hasData){
            final List<HomeData> data = snapshot.data!;
            return  SingleChildScrollView(
          child: Column(
            children: [
              HeroBanner(data: data,),
              RowPosts(data: data,title: 'Top Trending',),
              GridPost(data: data, title: 'For You')
            ],
          ),
        );
          }
          else{
            return Center(
              child: Text('no data available'),
            );
          }
        },
      ),
    );
  }
}
