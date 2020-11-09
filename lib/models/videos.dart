class Videos{
  // ignore: non_constant_identifier_names
  final String display_image;
  final String identifier;
  final String name;
  final String type;
  final String url;
 
  

  // ignore: non_constant_identifier_names
  Videos({this.identifier, this.name, this.type, this.url, this.display_image});

  factory  Videos.fromJson(Map<String, dynamic> json) {
    return  Videos(
      display_image:json['results']['display_image'],
      identifier: json['results']['identifier'],
      name: json['results']['name'],
      type: json['results']['type'],
      url: json['results']['url'],
      
     
    );
  }

  
}
