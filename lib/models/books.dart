import 'dart:convert';
List<Books> modelBooksFromJson(String str) => List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

String modelBooksToJson(List<Books> data) => json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));

class Books{
  final String identifier;
  final String name;
  final int type;
  final String url;
 
  

  Books({this.identifier, this.name, this.type, this.url});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
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
