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
}