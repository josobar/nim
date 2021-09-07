import'package:flutter/material.dart';
import 'game.dart';
import 'globals.dart';
import 'main.dart';

class Select extends StatefulWidget {

  Select({
    Key key,
    this.vsComputer,
    this.compDifficulty
}) : super(key: key);

  bool vsComputer;
  double compDifficulty;

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {


  Widget createButtonGraphic(var layout) {
    List<Widget> icons = [];
    List<Widget> rows = [];

    for(int i = 0; i < layout.length; i++) {
      for(int k = 0; k < layout[i]; k++) {
        icons += [Icon(Icons.brightness_1, color: Colors.white)];
      }
      rows += [Row(children: icons)];
      icons = [];
    }

    return Column(children: rows);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return MaterialApp(

      routes: {
        "/gameOne": (context) => Nim(layout: [1, 2, 3, 4, 5]),
        "/game2": (context) => Nim(layout: [1, 3, 5, 7]),
      },

      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: MediaQuery
                    .of(context)
                    .size
                    .height / 25,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Color(0xff20b07c),
            title: Text(
              "Choose a Layout",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .height / 25
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    ButtonTheme(
                      height: 100,
                      minWidth: 100,
                      buttonColor: Color(0xff20b07c),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20)
                      ),
                      child: RaisedButton(
                        child: createButtonGraphic([1, 2, 3, 4, 5]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Nim(layout: [1, 2, 3, 4, 5], vsComputer: widget.vsComputer)
                              )
                          );
                        },
                      ),
                    ),

                    ButtonTheme(
                      height: 100,
                      minWidth: 100,
                      buttonColor: Color(0xff20b07c),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20)
                      ),
                      child: RaisedButton(
                        child: createButtonGraphic([1, 3, 5, 7]),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Nim(layout: [1, 3, 5, 7], vsComputer: widget.vsComputer)
                              )
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
