import 'dart:convert';

class PaymentTypeModel {
  final int id;
  final String name;
  final String acronym;
  final bool enable;

  PaymentTypeModel(
      {required this.acronym,
      required this.enable,
      required this.id,
      required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'acronym': acronym,
      'enable': enable,
    };
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeModel.fromJson(String source) =>
      PaymentTypeModel.fromMap(json.decode(source));

  factory PaymentTypeModel.fromMap(Map<String, dynamic> map) {
    return PaymentTypeModel(
      acronym: map['acronym'] ?? "",
      enable: map['enable'] ?? false,
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
