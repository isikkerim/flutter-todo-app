class Todo {
  String title;
  String content;
  String dateAdded;
  bool isPrivate;

  Todo({
    required this.title,
    required this.content,
    required this.dateAdded,
    required this.isPrivate,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      content: json['content'],
      dateAdded: json['dateAdded'],
      isPrivate: json['isPrivate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'dateAdded': dateAdded,
      'isPrivate': isPrivate,
    };
  }
}

enum Important { high, mid, low }

