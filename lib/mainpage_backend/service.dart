import 'dart:convert';
import 'package:http/http.dart' as http;
import 'jsondata.dart';

class ServiceMainPage{
  static Future<List<JsonDataMainPage>> getPromo() async {
    try{
      final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_promo.php");
      if(response.statusCode == 200){
        List<JsonDataMainPage> list = parsePromoPhotos(response.body);
        return list;
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }
  static List<JsonDataMainPage> parsePromoPhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<JsonDataMainPage>((json) => JsonDataMainPage.fromJson(json)).toList();
  }
}