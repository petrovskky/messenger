class User {
  String? id;
  String name;
  String email;
  bool isActive;
  String phone;
  DateTime? birthday;
  String? photoUrl;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.phone,
    this.birthday,
    this.photoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json, String? id) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'] ?? false,
      phone: json['phone'],
      birthday: json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isActive': isActive,
      'phone': phone,
      'birthday': birthday?.toIso8601String(),
      'photoUrl': photoUrl,
    };
  }

  void edit({
    String? newName,
    String? newPhone,
    DateTime? newBirthday,
    String? newPhotoUrl,
  }) {
    if (newName != null) name = newName;
    if (newPhone != null) phone = newPhone;
    if (newBirthday != null) birthday = newBirthday;
    if (newPhotoUrl != null) photoUrl = newPhotoUrl;
  }

  void updateStatus(bool newStatus) {
    isActive = newStatus;
  }
}
