import 'package:flutter/material.dart';

class Media extends StatefulWidget {
  Media({Key key }) : super(key: key);

  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  _Media createState() => _Media();
}



class _Media extends State<Media>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
    Tab(icon: Icon(Icons.add_shopping_cart)),

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
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
            ],
          ),
      
        );
  }
}