import 'dart:convert';

import 'package:api_course/Models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Hitting API
  // making array bacause there is no name at the strt model of json array
  List<postmodel> PostList = [];
  Future<List<postmodel>> getpostapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      PostList.clear();
      for (Map<String, dynamic> i in data) {
        PostList.add(postmodel.fromJson(i));
      }
      return PostList;
    } else {
      return PostList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API COURSE')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            //Show API
            child: FutureBuilder(
                future: getpostapi(),
                builder: (context, Snapshot) {
                  if (!Snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: PostList.length,
                        itemBuilder: (context, Index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title\n' +
                                      PostList[Index].title.toString()),
                                  Text('Description\n' +
                                      PostList[Index].body.toString())
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
