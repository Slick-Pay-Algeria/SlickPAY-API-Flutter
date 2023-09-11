import 'contact.dart';

class Aggregation {
  final String? url;
  final String? serial;
  final String? amount;
  final String? contacts;

  Aggregation({
    required this.url,
    required this.type,
    required this.total,
    required this.contacts,
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

 