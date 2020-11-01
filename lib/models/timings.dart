class Timings {
  final String asr;
  final String dhur;
  final String fajr;
  final String imsak;
  final String isha;
  final String maghrib;
  final String midnight;
  final String sunrise;
  final String sunset;
  

  Timings({this.asr, this.dhur, this.fajr, this.imsak, this.isha, this.maghrib,
      this.midnight, this.sunrise, this.sunset});

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      asr: json['timings']['asr'],
      dhur: json['timings']['dhur'],
      fajr: json['timings']['fajr'],
      imsak: json['timings']['imsak'],
      isha: json['timings']['isha'],
      maghrib: json['timings']['maghrib'],
      midnight: json['timings']['midnight'],
      sunrise: json['timings']['sunrise'],
      sunset: json['timings']['sunset'],
     
    );
  }

  convertdate(String d){
    var date = DateTime.parse("2020-01-20 "+d);
    return date.toString();

  }
}
