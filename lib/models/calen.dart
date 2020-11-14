import 'dart:convert';

import 'package:mehdavia/views/calendar.dart';
List<Calendar> modelBooksFromJson(String str) => List<Calendar>.from(json.decode(str).map((x) => Calendar.fromJson(x)));

String modelBooksToJson(List<Calendar> data) => json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));
class Calen{
  final String gregorianDay;
  final String gregorianMonth;
  final String hijriDay;
  final String hijriMonth;
  final String name;
 
  

  Calen({this.gregorianDay, this.gregorianMonth, this.hijriDay, this.hijriMonth,this.name});

  factory Calen.fromJson(Map<String, dynamic> json) {
    return Calen(
      gregorianDay: json['gregorianDay'],
      gregorianMonth: json['gregorianMonth'],
      hijriDay: json['hijriDay'],
      hijriMonth: json['hijriMonth'],
      name: json['name'],
      
     
    );
  }
  Map<String, dynamic> toJson() => {
    "gregorianDay": gregorianDay,
      "gregorianMonth":gregorianMonth,
      "hijriDay": hijriDay,
      "hijriMonth":hijriMonth,
      "name":name,
      
    
  };

  
}
