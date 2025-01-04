import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinker_bootcamp_app/APIs/search_service.dart';
import 'package:tinker_bootcamp_app/Core/constants/colors.dart';
import 'package:tinker_bootcamp_app/Models/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<SearchData> searchResults = [];
  Timer? _debounce;
  bool isLoading = false;

  void onSearchChanged(String query){
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () async {
        if (query.isNotEmpty) {
          setState((){
            isLoading = true;
          });
          final result = await getSeacrh(query);
          setState(() {
            searchResults = result;
            isLoading = false;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.black,
        surfaceTintColor: MyColors.black,
        leading: Icon(
          Icons.search,
          color: MyColors.white,
          size: 30,
        ),
        title: CupertinoSearchTextField(
          style: TextStyle(color: MyColors.white),
          onChanged: (value) {
            onSearchChanged(value);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index].title,
                style: TextStyle(
                  color: MyColors.white
                ),),
              );
            },
            separatorBuilder: (ctx, index) => Divider(),
            itemCount: searchResults.length),
      ),
    );
  }
}
