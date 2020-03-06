import 'dart:convert';

import 'package:async/async.dart';
import 'package:bintang_motor/mainpage_backend/getdata-mp.dart';
import 'package:http/http.dart' as http;

class ServiceMp {
  static Future<List<AlbumMp>> getPhotos() async {
    try{
      final response =
          await http.get("https://bintang-niagajaya.000webhostapp.com/api_promo.php");
      if(response.statusCode == 200){
        List<AlbumMp> list = parsePhotos(response.body);
        return list;
      }
      else {
        throw Exception("Error");
      }
    }
    catch (e){
      throw Exception(e.toString());
    }
  }
  static List<AlbumMp> parsePhotos(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AlbumMp>((json) => AlbumMp.fromJson(json)).toList();
  }
}