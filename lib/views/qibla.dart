import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:mehdavia/views/qibalah_compass.dart';
import 'package:mehdavia/views/loading_indicator.dart';

class Qibla extends StatefulWidget {
  Qibla({Key key }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".

  

  @override
  _Qibla createState() => _Qibla();
}


class _Qibla extends State<Qibla> {

  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qibla Locator"),
      ),
      body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data)
              return QiblahCompass();
          },
        ),
      );
  
  }
}