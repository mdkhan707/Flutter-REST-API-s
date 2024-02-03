import 'package:api_course/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<usermodel> UserList = [];
  Future<List<usermodel>> getuserapi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        UserList.add(usermodel.fromJson(i));
      }
      return UserList;
    } else {
      return UserList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(child: Text('API COURSE')),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getuserapi(),
                  builder: (context, AsyncSnapshot<List<usermodel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: UserList.length,
                          itemBuilder: (context, Index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ReuseableRow(
                                        title: 'Name',
                                        value: snapshot.data![Index].name
                                            .toString()),
                                    ReuseableRow(
                                        title: 'UserNmae',
                                        value: snapshot.data![Index].username
                                            .toString()),
                                    ReuseableRow(
                                        title: 'Email',
                                        value: snapshot.data![Index].email
                                            .toString()),
                                    ReuseableRow(
                                        title: 'Address',
                                        value: snapshot.data![Index].address
                                            .toString()),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
