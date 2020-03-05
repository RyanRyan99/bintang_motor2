class JsonDataMainPage{
  String id;
  String title;
  String date;
  String category;
  String alamat;
  String promo;
  String syarat;
  String images;

  JsonDataMainPage({this.id, this.title, this.date, this.category, this.alamat, this.promo, this.syarat, this.images});
  // Return object from JSON //
  factory JsonDataMainPage.fromJson(Map<String, dynamic> json){
    return JsonDataMainPage(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      category: json['category'],
      alamat: json['alamat'],
      promo: json['promo'],
      syarat: json['syarat'],
      images: json['image'],
    );
  }
}
