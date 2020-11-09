import 'dart:convert';
List<Photos> modelBooksFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String modelBooksToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));
class Photos{
  final String identifier;
  final String name;
  final int type;
  final String url;
 
  

  Photos({this.identifier, this.name, this.type, this.url});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      identifier: json['identifier'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      
     
    );
  }
  Map<String, dynamic> toJson() => {
    "identifier": identifier,
    "name": name,
    "type" : type,
    "url" : url
  };

  
}
