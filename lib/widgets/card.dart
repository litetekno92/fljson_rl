import 'package:fljson_rl/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoCard extends StatefulWidget {

  final Photo photo;

  
  PhotoCard( this.photo );

  @override
  _PhotoCardState createState() => _PhotoCardState(photo);
}

  class _PhotoCardState extends State<PhotoCard> {
   Photo photo;

   _PhotoCardState(this.photo);

  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
    Scaffold(
      body:
            Card(
              child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: new Text(photo.title),
                  trailing: new Image.network(
                    photo.thumbnailUrl,
                    fit: BoxFit.cover,
                    height: 40.0,
                    width: 40.0,
                  )),
            )
    );
   
  }

 

}