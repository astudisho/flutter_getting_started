import 'package:flutter/material.dart';
import 'package:hello_flutter/Models/weather.dart';
import 'package:hello_flutter/shared/menu_bottom.dart';
import 'package:hello_flutter/shared/menu_drawer.dart';
import 'package:hello_flutter/services/http_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Weather result;
  var txtPlace = TextEditingController();
  final double padding = 16;
  final double fontSize = 20;
  var fractionDigits = 2;

  @override
  void initState() {
    result = Weather('', '', 0, 0, 0, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                    hintText: 'Enter a City',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: getData,
                    )),
              ),
            ),
            weatherRow("Place", result.name),
            weatherRow("Description", result.description),
            weatherRow("Temperature",
                result.temperature.toStringAsFixed(fractionDigits)),
            weatherRow(
                "Perceived", result.perceived.toStringAsFixed(fractionDigits)),
            weatherRow(
                "Humidity", result.humidity.toStringAsFixed(fractionDigits)),
            weatherRow(
                "Pressure", result.pressure.toStringAsFixed(fractionDigits)),
          ],
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      // body: ,
    );
  }

  void getData() async {
    var httpService = HttpService();
    var response = await httpService.getWeather(txtPlace.text);

    setState(() {
      result = response;
    });
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(
                    fontSize: fontSize, color: Theme.of(context).hintColor),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: fontSize, color: Theme.of(context).hintColor),
              ))
        ],
      ),
    );

    return row;
  }
}
