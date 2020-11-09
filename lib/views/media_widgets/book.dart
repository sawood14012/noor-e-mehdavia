import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mehdavia/models/books.dart';
import 'package:http/http.dart' as http;

class Book extends StatefulWidget {
  Book({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Book createState() => _Book();
}

class _Book extends State<Book> {
  Future<Books> books_data;
  @override
  Widget build(BuildContext context) {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<Books>(
            future: books_data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.name);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }));
  }
}

Future<Books> fetchBooks() async {
  var uri = Uri.https('api.nooremahdavia.com', "/media/book");

  print(uri);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    print(response.body);
    return Books.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Books');
  }
}
