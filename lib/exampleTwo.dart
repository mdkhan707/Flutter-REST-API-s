import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photoList = [];

  Future<List<Photos>> getPhoto() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        Photos photos = Photos(title: i[Title], url: i['url']);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Example 2 API')),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhoto(),
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: photoList.length,
                        itemBuilder: (context, Index) {
                          return const ListTile(
                              //  title: Text(snapshot.data[Index].title.toString()),
                              );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  Photos({required this.title, required this.url});
}
