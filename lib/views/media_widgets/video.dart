import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mehdavia/models/videos.dart';


class Video extends StatefulWidget {
  Video({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Video createState() => _Video();
}

class _Video extends State<Video> {

  
  Future<List<Videos>> video_data;

    @override
  void initState() {
    video_data = fetchvideos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<List<Videos>>(
            future: video_data,
            builder: (context, snapshot) {
              print(snapshot.toString());
              if (snapshot.hasData) {
               return ListView.builder(
                 itemCount: snapshot.data.length,
                 itemBuilder: (context,i){
                     final datalist = snapshot.data[i];
                     return Container(
                       child: Card(child: Column(children: [ Text(datalist.display_image),Text(datalist.identifier), Text(datalist.name), Text(datalist.url)],),),
                     );
                 });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }));
  }
}

Future<List<Videos>> fetchvideos() async {
  var uri = Uri.https('api.nooremahdavia.com', "/media/video");
  List<Videos> ListModel = [];
  print(uri);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    //print(response.body.toString());
    final data = jsonDecode(response.body);
    
    for(Map i in data['results']){
      //print(i);
      ListModel.add(Videos.fromJson(i));
    }
   return ListModel;
  } else {
    throw Exception('Failed to load Videos');
  }
}
