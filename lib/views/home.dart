import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:mehdavia/views/qibalah_compass.dart';
import 'package:mehdavia/views/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mehdavia/models/timings.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build metrhod of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  String _lat = "Loading..!";
  String _long = "Loading..!";
  Position _currentPosition;
  bool _locset = false;
  bool _progress = false;
  Future<Timings> timings;
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  var now = new DateTime.now();

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _home();
  }

  Widget _home() {
    return Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<Timings>(
      future: timings,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
            Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      /*  ListTile(
                      leading: Icon(CupertinoIcons.hourglass_bottomhalf_fill),
                      title: Text("Fajr : 5:00 am"),
                      subtitle: Text("15 min's left"),
                    ),
                    Divider(
                      height: 10,
                      thickness: 3,
                    ), */
                      ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text("Today's Timings")]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(CupertinoIcons.sunrise),
                            ),
                            label: Text(convertdate12(snapshot.data.sunrise)),
                          ),
                          const SizedBox(width: 8),
                          Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(CupertinoIcons.sunset),
                            ),
                            label: Text(convertdate12(snapshot.data.sunset)),
                          ),
                          const SizedBox(width: 8),
                          Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              child: Icon(CupertinoIcons.moon_stars),
                            ),
                            label: Text(convertdate12(snapshot.data.midnight)),
                          )
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 3,
                      ),
                      ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Text("Prayer Timings")]),
                      ),
                      DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Prayer',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Start Time',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'End Time',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Fajr')),
                              DataCell(Text(convertdate12(snapshot.data.fajr))),
                              DataCell(Text(convertdate(snapshot.data.fajr))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Dhur')),
                              DataCell(Text(convertdate12(snapshot.data.dhur))),
                              DataCell(Text(convertdate(snapshot.data.dhur))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Asr')),
                              DataCell(Text(convertdate12(snapshot.data.asr))),
                              DataCell(Text(convertdate(snapshot.data.asr))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Maghrib')),
                              DataCell(
                                  Text(convertdate12(snapshot.data.maghrib))),
                              DataCell(
                                  Text(convertdate(snapshot.data.maghrib))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Isha')),
                              DataCell(Text(convertdate12(snapshot.data.isha))),
                              DataCell(Text(convertdate(snapshot.data.isha))),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('Qiyam')),
                              DataCell(
                                  Text(convertdate12(snapshot.data.imsak))),
                              DataCell(Text(convertdate(snapshot.data.imsak))),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        height: 10,
                        thickness: 3,
                      ),
                      ListTile(
                        leading: Icon(CupertinoIcons.sun_min),
                        title: Text("Morning Zikr"),
                        subtitle: Text(zikr(snapshot.data.fajr)),
                      ),
                      Divider(
                        height: 10,
                        thickness: 3,
                      ),
                      ListTile(
                        leading: Icon(CupertinoIcons.moon_zzz),
                        title: Text("Evening Zikr"),
                        subtitle: Text(zikr(snapshot.data.asr)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    ));
  }

  _getCurrentLocation() async {
    setState(() {
      _progress = true;
    });
    if (_locset) {
      setState(() {
        _progress = false;
      });
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      print(permission);
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        print(position);
        print(DateTime.now().toString());
        timings = fetchTimings(position.latitude.toString(),
            position.longitude.toString(), DateTime.now().toString());
        setState(() {
          _progress = false;
          _currentPosition = position;
          _locset = true;
          _lat = position.latitude.toString();
          _long = position.longitude.toString();
        });
      }).catchError((e) {
        print(e);
        _progress = false;
      });
    }
  }

  convertdate(String d) {
    var date = DateTime.parse("2020-01-20 " + d);
    var pdate = date.add(Duration(minutes: 15));
    var newdate = DateFormat("h:mma").format(pdate);

    return newdate.toString();
  }

  convertdate12(String d) {
    var date = DateTime.parse("2020-01-20 " + d);
    var newdate = DateFormat("h:mma").format(date);

    return newdate.toString();
  }

  zikr(String d) {
    var date = DateTime.parse("2020-01-20 " + d);
    var pdate = date.add(Duration(minutes: 30));
    var newdate = DateFormat("h:mma").format(pdate);

    return newdate.toString();
  }

  /*  nextprayer(String fajr, String dhur, String asr, String magrib, String isha){
    var now = DateTime.now();
    var hour = now.hour.toString();
    var dates = [];
    dates.add(DateTime.parse("2020-01-20 "+fajr));
    dates.add(DateTime.parse("2020-01-20 "+dhur));
    dates.add(DateTime.parse("2020-01-20 "+asr));
    dates.add(DateTime.parse("2020-01-20 "+magrib));
    dates.add(DateTime.parse("2020-01-20 "+isha));

     

} */
}

Future<Timings> fetchTimings(String lat, String long, String date) async {
  var queryParams = {'date': date, 'lon': long, 'lat': lat};

  var uri =
      Uri.https('api.nooremahdavia.com', "/prayer_timings/day", queryParams);

  print(uri);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    print(response.body);
    return Timings.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load prayer timings');
  }
}
