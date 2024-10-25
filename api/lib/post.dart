class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> mapa){
    return Post(
      userId: mapa['userId'],
      id: mapa['id'],
      title: mapa['title'],
      body: mapa['body'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

}