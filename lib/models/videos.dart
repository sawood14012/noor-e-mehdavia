import 'dart:convert';
List<Videos> modelBooksFromJson(String str) => List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

String modelBooksToJson(List<Videos> data) => json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));
class Videos{
  // ignore: non_constant_identifier_names
  final String display_image;
  final String identifier;
  final String name;
  final int type;
  final String url;
 
  

  // ignore: non_constant_identifier_names
  Videos({this.identifier, this.name, this.type, this.url, this.display_image});

  factory  Videos.fromJson(Map<String, dynamic> json) {
    return  Videos(
      display_image:json['display_image'],
      identifier: json['identifier'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      
     
    );
  }
Map<String, dynamic> toJson() => {
    "display_image":display_image,
    "identifier": identifier,
    "name": name,
    "type" : type,
    "url" : url
  };

  
}
