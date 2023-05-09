class CryptoUser {
  String? name;
  String? email;
  String? phoneNumber;

  CryptoUser.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phoneNumber = json['phone'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'phone': phoneNumber};
}
