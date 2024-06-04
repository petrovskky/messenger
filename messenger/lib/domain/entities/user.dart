class User {
  String id;
  String name;
  String email;
  bool isActive;
  String phone;
  DateTime? birthday;
  String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isActive,
    required this.phone,
    this.birthday,
    this.photoUrl,
  });

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
