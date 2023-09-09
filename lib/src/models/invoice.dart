class Invoice {
  final int? id;
  final int? completed;
  final String? status;
  final String? serial;
  final String? to;
  final String? merchant;
  final String? email;
  final String? address;
  final double? amount;
  final List<dynamic>?
      items; // You can change the type to match the actual data type
  final String? url;
  final String? qrCode;
  final DateTime? date;
  final int? payStatus;

  Invoice({
    required this.id,
    required this.completed,
    required this.status,
    required this.serial,
    required this.to,
    required this.merchant,
    required this.email,
    required this.address,
    required this.amount,
    required this.items,
    required this.url,
    required this.qrCode,
    required this.date,
    required this.payStatus,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'] ?? 0,
      completed: json['completed'] ?? 0,
      status: json['status'] ?? "",
      serial: json['serial'] ?? "",
      to: json['to'] ?? "",
      merchant: json['merchant'] ?? "",
      email: json['email'] ?? "",
      address: json['address'] ?? "",
      amount: double.parse(json['amount']
          .replaceAll(',', '')), // Remove commas and parse as double
      items: json['items'] ??
          [], // You may need to specify the actual data type for items
      url: json['url'] ?? "",
      qrCode: json['qrCode'] ?? "",
      date: DateTime.parse(json['date']),
      payStatus: json['pay_status'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'completed': completed,
      'status': status,
      'serial': serial,
      'to': to,
      'merchant': merchant,
      'email': email,
      'address': address,
      'amount': amount,
      'items': items,
      'url': url,
      'qrCode': qrCode,
      'date': date?.toIso8601String(),
      'payStatus': payStatus,
    };
  }
}
