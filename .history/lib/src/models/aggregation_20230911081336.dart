import 'contact.dart';

class Aggregation {
 
  final String? serial;
  final String? amount;
  final String? status;

  Aggregation({
     required this.serial,
    required this.amount,
    required this.status,
  });

  factory Aggregation.fromJson(Map<String, dynamic> json) {
   

    return Aggregation(
       serial: json['serial'] ?? '',
      amount: json['amount'] ?? 0,
      status: json['status'] ?? "" ,
    ); 
  }
}

 