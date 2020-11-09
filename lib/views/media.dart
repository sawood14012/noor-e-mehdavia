import 'package:flutter/material.dart';
import 'media_widgets/book.dart';
import 'media_widgets/quote.dart';
import 'media_widgets/video.dart';
import 'media_widgets/photo.dart';
class Media extends StatefulWidget {
  Media({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Media createState() => _Media();
}

class _Media extends State<Media> with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.book)),
    Tab(icon: Icon(Icons.format_quote_sharp)),
    Tab(icon: Icon(Icons.movie)),
    Tab(icon: Icon(Icons.photo_sharp)),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
          child: new Container(
            color: Theme.of(context).primaryColor,
            child: new SafeArea(
              child: Column(
                children: <Widget>[
                  new Expanded(child: new Container()),
                  new TabBar(
                    onTap: (index) {
                      // Should not used it as it only called when tab options are clicked,
                      // not when user swapped
                    },
                    controller: _controller,
                    tabs: list,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight)),
      body: TabBarView(
        controller: _controller,
        children: [
          Book(title: "Books",),
          Quote(title: "Quotes"),
          Video(title: "Videos"),
          Photo(title:"Photos")
          
          
        ],
      ),
    );
  }
}
