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
    final List<dynamic> contactList = json['contacts'] ?? [];
    final List<Contact> parsedContacts = contactList
        .map((contactData) => Contact.fromJson(contactData))
        .toList();

    return Aggregation(
      url: json['url'] ?? '',
      type: json['type'] ?? '',
      total: json['total'] ?? 0,
      contacts: parsedContacts,
    );
  }
}

 