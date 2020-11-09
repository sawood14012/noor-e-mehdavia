class Quotes{
  final String identifier;
  final String name;
  final String type;
  final String url;
 
  

  Quotes({this.identifier, this.name, this.type, this.url});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      identifier: json['results']['identifier'],
      name: json['results']['name'],
      type: json['results']['type'],
      url: json['results']['url'],
      
     
    );
  }

  
}
