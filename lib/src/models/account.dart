class Account {
  final int? id;
  final String? rib;
  final String? title;
  final String? lastname;
  final String? firstname;
  final String? address;

  Account({
    required this.id,
    required this.rib,
    required this.title,
    required this.lastname,
    required this.firstname,
    required this.address,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] ?? 0,
      rib: json['rib'] ?? "",
      title: json['title'] ?? "",
      lastname: json['lastname'] ?? "",
      firstname: json['firstname'] ?? "",
      address: json['address'] ?? "",
    );
  }
}
