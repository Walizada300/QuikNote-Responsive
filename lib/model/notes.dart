// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notes {
  final int id;
  final String title;
  final String content;
  final String color;
  final String created;
  final bool isSynced;

  Notes({
    required this.id,
    required this.title,
    required this.content,
    required this.color,
    required this.created,
    required this.isSynced,
  });

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      content: json['content'],
      color: json['color'],
      created: json['created'],
      isSynced: json['isSynced'],
    );
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      id: int.parse(map['id'].toString()),
      title: map['title'],
      content: map['content'],
      color: map['color'],
      created: map['created'],
      isSynced: map['isSynced'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'color': color,
      'created': created,
      'isSynced': isSynced,
    };
  }
}
