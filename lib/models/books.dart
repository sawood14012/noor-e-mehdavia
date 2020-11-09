class Books{
  final String identifier;
  final String name;
  final String type;
  final String url;
 
  

  Books({this.identifier, this.name, this.type, this.url});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      identifier: json['results']['identifier'],
      name: json['results']['name'],
      type: json['results']['type'],
      url: json['results']['url'],
      
     
    );
  }

  
}
