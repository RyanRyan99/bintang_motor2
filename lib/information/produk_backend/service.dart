import 'dart:convert';
import 'package:http/http.dart' as http;
import 'getdata-prod.dart';

class ServiceProd {
  static Future<List<AlbumProd>> getPhotos() async {
    try{
      final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_motor_manual.php");
      if(response.statusCode == 200) {
        List<AlbumProd> list = parsePhotos(response.body);
        return list;
      }
      else {
        throw Exception("Error");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }

  static List<AlbumProd> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AlbumProd>((json) => AlbumProd.fromJson(json)).toList();
  }
}