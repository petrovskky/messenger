class Message {
  final String id;
  final String dialogId;
  final String senderId;
  final DateTime dateTime;
  String text;
  List<String> files;
  List<String> photos;
  bool isEdited;
  bool isDeleted;
  bool isRead;
  String language;

  Message({
    required this.id,
    required this.dialogId,
    required this.senderId,
    required this.dateTime,
    this.text = '',
    this.files = const [],
    this.photos = const [],
    this.isEdited = false,
    this.isDeleted = false,
    this.isRead = false,
    this.language = '',
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      dialogId: json['dialogId'],
      senderId: json['senderId'],
      dateTime: DateTime.parse(json['dateTime']),
      text: json['text'],
      files: List<String>.from(json['files'] ?? []),
      photos: List<String>.from(json['photos'] ?? []),
      isEdited: json['isEdited'],
      isDeleted: json['isDeleted'],
      isRead: json['isRead'],
      language: json['language'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dialogId': dialogId,
      'senderId': senderId,
      'dateTime': dateTime.toIso8601String(),
      'text': text,
      'files': files,
      'photos': photos,
      'isEdited': isEdited,
      'isDeleted': isDeleted,
      'isRead': isRead,
      'language': language,
    };
  }

  void edit({String? newText, List<String>? newFiles, List<String>? newPhotos}) {
    if (newText != null) text = newText;
    if (newFiles != null) files = newFiles;
    if (newPhotos != null) photos = newPhotos;
    if (newText != null || newFiles != null || newPhotos != null) isEdited = true;
  }
}