import 'dart:convert';
List<Quotes> modelBooksFromJson(String str) => List<Quotes>.from(json.decode(str).map((x) => Quotes.fromJson(x)));

String modelBooksToJson(List<Quotes> data) => json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));
class Quotes{
  final String identifier;
  final String name;
  final int type;
  final String url;
 
  

  Quotes({this.identifier, this.name, this.type, this.url});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
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
