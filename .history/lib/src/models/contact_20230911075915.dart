class Contact {
  final String? uuid;
  final String? title;
  final String? lastName;
  final String? firstName;
  final String? email;
  final String? address;
  final String? rib;

  Contact({
    required this.uuid
    required this.title,
    required this.lastName,
    required this.firstName,
    required this.email,
    required this.address,
    required this.rib,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        title: json['title'] ?? "",
      title: json['title'] ?? "",
      lastName: json['lastname'] ?? "",
      firstName: json['firstname'] ?? "",
      email: json['email'] ?? "",
      address: json['address'] ?? "",
      rib: json['rib'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'lastname': lastName,
      'firstname': firstName,
      'email': email,
      'address': address,
      'rib': rib,
    };
  }
}
