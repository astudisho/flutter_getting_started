import 'package:flutter/material.dart';
import 'package:hello_flutter/shared/menu_bottom.dart';
import 'package:hello_flutter/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtWeight = TextEditingController();
  final TextEditingController txtHeight = TextEditingController();
  final double fontSize = 18;
  final double paddingSize = 24.0;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? width;
  late List<bool> isSelected;
  String heightMessage = '';
  String widthMessage = '';

  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please introduce your height in ' + ((isMetric) ? 'meters' : 'inches');
    widthMessage =
        'Please introduce your weight in ' + ((isMetric) ? 'kilos' : 'pounds');
    return Scaffold(
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ToggleButtons(
                isSelected: isSelected,
                onPressed: toggleMeasure,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Metric",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Imperial",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ),
                ]),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: TextField(
                controller: txtHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: heightMessage,
                    icon: const Icon(Icons.straighten)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize),
              child: TextField(
                controller: txtWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: widthMessage,
                    icon: const Icon(Icons.monitor_weight)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(paddingSize + 8),
              child: ElevatedButton(
                  onPressed: calculateBmi,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  )),
            ),
            Text(
              result,
              style: TextStyle(fontSize: fontSize),
            )
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      result = 'Your BMI is ' + bmi.toStringAsFixed(2);
    });
  }

  void toggleMeasure(index) {
    if (index == 0) {
      isMetric = true;
      isImperial = false;
    }
    if (index == 1) {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
}
