class Transfer {
  final int? id;
  final String? uuid;
  final int? defaultUser;
  final String? title;
  final String? rib;
  final String? firstName;
  final String? lastName;
  final String? address;
  final DateTime? createdAt;

  Transfer({
    required this.id,
    required this.uuid,
    required this.defaultUser,
    required this.title,
    required this.rib,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.createdAt,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      id: json['id'] ?? 0,
      uuid: json['uuid'] ?? "",
      defaultUser: json['default'] ?? "",
      title: json['title'] ?? "",
      rib: json['rib'] ?? "",
      firstName: json['firstname'] ?? "",
      lastName: json['lastname'] ?? "",
      address: json['address'] ?? "",
      createdAt: DateTime.parse(json['created_at'] ?? ""),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'default': defaultUser, // Change 'default' to match your JSON field name
      'title': title,
      'rib': rib,
      'firstname': firstName,
      'lastname': lastName,
      'address': address,

      'created_at': createdAt?.toIso8601String(),
    };
  }
}
