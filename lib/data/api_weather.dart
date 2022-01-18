import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/coordinate.dart';
import 'package:weather_app/models/weather.dart';

class WeatherApi {
  Coordinate coordinateData;
  Weather weatherData;
  String apiKey = "0c30e81a3c02de8748654162e2616c98";

  Future<void> getDataByCityName(String cityName) async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=0c30e81a3c02de8748654162e2616c98";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData != null) {
      Coordinate coordinate = Coordinate(
        lat: jsonData["coord"]["lat"],
        lon: jsonData["coord"]["lon"],
        name: jsonData["name"],
      );
      coordinateData = coordinate;

      Weather weather = Weather(
        id: jsonData["weather"][0]["id"],
        main: jsonData["weather"][0]["main"],
        description: jsonData["weather"][0]["description"],
        icon: jsonData["weather"][0]["icon"],
        temp: jsonData["main"]["temp"],
        feelsLike: jsonData["main"]["feels_like"],
        tempMin: jsonData["main"]["temp_min"],
        tempMax: jsonData["main"]["temp_max"],
        //pressure: jsonData["main"]["pressure"],
        humidity: jsonData["main"]["humidity"],
      );
      weatherData = weather;
    }
  }
}
