class Photos{
  final String identifier;
  final String name;
  final String type;
  final String url;
 
  

  Photos({this.identifier, this.name, this.type, this.url});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      identifier: json['results']['identifier'],
      name: json['results']['name'],
      type: json['results']['type'],
      url: json['results']['url'],
      
     
    );
  }

  
}
