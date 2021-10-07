import 'dart:convert';

import 'package:hello_flutter/Models/weather.dart';
import 'package:http/http.dart' as http;

class HttpService {
  //https://api.openweathermap.org/data/2.5/weather?q=Guadalajara&APPID=31045ea9ae80e7761096bfa5f16b9f9e
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '31045ea9ae80e7761096bfa5f16b9f9e';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    Map<String, dynamic> data = json.decode(result.body);

    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
