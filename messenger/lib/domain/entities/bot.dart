class Bot {
  final String id;
  final String name;
  final String? description;
  final String? photoUrl;

  Bot({
    required this.id,
    required this.name,
    this.description,
    this.photoUrl,
  });

  factory Bot.fromJson(Map<String, dynamic> json) {
    return Bot(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoUrl: json['photoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'photoUrl': photoUrl,
    };
  }
}