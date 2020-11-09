class Videos{
  final String display_image;
  final String identifier;
  final String name;
  final String type;
  final String url;
 
  

  Videos({this.identifier, this.name, this.type, this.url});

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      display_image:json['results']['display_image']
      identifier: json['results']['identifier'],
      name: json['results']['name'],
      type: json['results']['type'],
      url: json['results']['url'],
      
     
    );
  }

  
}
