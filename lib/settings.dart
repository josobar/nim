import'package:flutter/material.dart';
import 'game.dart';
import 'select_screen.dart';
import 'globals.dart' as globals;

class Settings extends StatefulWidget {

  Settings({
    Key key,
    this.rpf = false
}) : super(key: key);

  bool rpf;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.height / 25
            ),
          ),
        ),

        body: Container(
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: Text("Rightmost Player goes First"),
                value: true,
                onChanged: (bool e) {

                },
              )
            ],
          ),
        )
      ),
    );
  }
}
