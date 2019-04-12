import 'dart:convert';

import 'package:fljson_rl/models/photo.dart';
import 'package:fljson_rl/utils/API.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  // List<Photo> list = List();
  var photos = new List<Photo>();
  var isLoading = false;

  _fetchData() {
    setState(() {
      isLoading = true;
    });
    API.fetchData().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        photos = list.map((model) => Photo.fromJson(model)).toList();
        isLoading = false;
      });
    });
  }

  initState() {
    super.initState();
    _fetchData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: new Text(photos[index].title),
                  trailing: new Image.network(
                    photos[index].thumbnailUrl,
                    fit: BoxFit.cover,
                    height: 40.0,
                    width: 40.0,
                  )),
            );
          },
        )
    );
  }
}
