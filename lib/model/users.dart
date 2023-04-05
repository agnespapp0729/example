class GetUserFromJson {
  int id;
  String name;
  String email;
  String phoneNumber;

  GetUserFromJson({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory GetUserFromJson.fromJson(Map<String, dynamic> json) {
    return GetUserFromJson(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone']);
  }
}
