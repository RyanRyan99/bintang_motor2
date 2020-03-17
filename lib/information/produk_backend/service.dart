import 'dart:convert';
import 'package:http/http.dart' as http;
import 'getdata-prod.dart';

class ServiceProd {
  static Future<List<AlbumProdManual>> getPhotos() async {
    try{
      final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_motor_manual.php");
      if(response.statusCode == 200) {
        List<AlbumProdManual> list = parsePhotos(response.body);
        return list;
      }
      else {
        throw Exception("Error");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }

  static List<AlbumProdManual> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AlbumProdManual>((json) => AlbumProdManual.fromJson(json)).toList();
  }
}
class ServiceProdMatic {
  static Future<List<AlbumProdMatic>> getPhotos() async {
    try{
      final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_motor_matic.php");
      if(response.statusCode == 200) {
        List<AlbumProdMatic> list = parsePhotos(response.body);
        return list;
      }
      else {
        throw Exception("Error");
      }
    }catch (e){
      throw Exception(e.toString());
    }
  }
  static List<AlbumProdMatic> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AlbumProdMatic>((json) => AlbumProdMatic.fromJson(json)).toList();
  }
}
class ServiceProdCub {
  static Future<List<AlbumProdCub>> getPhotos() async {
    try{
      final response = await http.get("https://bintang-niagajaya.000webhostapp.com/api_motor_cub.php");
      if(response.statusCode == 200){
        List<AlbumProdCub> list = parsePhotos(response.body);
        return list;
      }
      else {
        throw Exception("Error");
      }
    }catch (e) {
      throw Exception(e.toString());
    }
  }
  static List<AlbumProdCub> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AlbumProdCub>((json) => AlbumProdCub.fromJson(json)).toList();
  }
}