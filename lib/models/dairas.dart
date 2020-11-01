class Dairas{
  final String longitude;
  final String latitude;
  final String address;
  final String type;
 
  

  Dairas({this.longitude, this.latitude, this.address, this.type});

  factory Dairas.fromJson(Map<String, dynamic> json) {
    return Dairas(
      longitude: json['dairas']['longitude'],
      latitude: json['dairas']['latitude'],
      address: json['dairas']['address'],
      type: json['dairas']['type'],
      
     
    );
  }

  
}
