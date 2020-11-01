class Mousques{
  final String longitude;
  final String latitude;
  final String address;
  final String type;
 
  

  Mousques({this.longitude, this.latitude, this.address, this.type});

  factory Mousques.fromJson(Map<String, dynamic> json) {
    return Mousques(
      longitude: json['mousques']['longitude'],
      latitude: json['mousques']['latitude'],
      address: json['mousques']['address'],
      type: json['mousques']['type'],
      
     
    );
  }

  
}
