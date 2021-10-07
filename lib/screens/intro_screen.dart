import 'package:flutter/material.dart';
import 'package:hello_flutter/shared/menu_bottom.dart';
import 'package:hello_flutter/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MenuBottom(),
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text("Choco chimi"),
      ),
      body: Container(
        child: Center(
            child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Text(
                  "Popito, pelusa y bomboloña",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey)
                  ]),
                ))),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/cat.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
