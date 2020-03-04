class JsonDataMainPage{
  String id;
  String title;
  String date;
  String category;
  String alamat;
  String promo;
  String syarat;
  String image;

  JsonDataMainPage({this.id, this.title, this.date, this.category, this.alamat, this.promo, this.syarat, this.image});
  factory JsonDataMainPage.fromJson(Map<String, dynamic> json){
    return JsonDataMainPage(
      id: json['id'],
      title: json['title'],
      date: json['date'],
      category: json['category'],
      alamat: json['alamat'],
      promo: json['promo'],
      syarat: json['syarat'],
      image: json['image'],
    );
  }
}
