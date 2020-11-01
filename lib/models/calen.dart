class Calen{
  final String gregorianDay;
  final String gregorianMonth;
  final String hijriDay;
  final String hijriMonth;
  final String name;
 
  

  Calen({this.gregorianDay, this.gregorianMonth, this.hijriDay, this.hijriMonth,this.name});

  factory Calen.fromJson(Map<String, dynamic> json) {
    return Calen(
      gregorianDay: json['calen']['gregorianDay'],
      gregorianMonth: json['calen']['gregorianMonth'],
      hijriDay: json['calen']['hijriDay'],
      hijriMonth: json['calen']['hijriMonth'],
      name: json['calen']['name'],
      
     
    );
  }

  
}
