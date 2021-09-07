import'package:flutter/material.dart';
import 'game.dart';
import 'select_screen.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: MediaQuery.of(context).size.height / 25,
            ),
            onPressed: () => Navigator.of(context).pop()
        ),
        backgroundColor: Color(0xff20b07c),
        title: Text(
          "Tutorial",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height / 25
          ),
        ),
      ),
    );
  }
}

