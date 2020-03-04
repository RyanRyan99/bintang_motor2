class Album {
  String id;
  String title;
  String category;
  String date;
  String content;
  String images;

  Album({this.id, this.title, this.category, this.date, this.content, this.images});

  // Return object from JSON //
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        date: json['date'],
        content: json['content'],
        images: json['image'],

    );
  }
}