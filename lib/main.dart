
/*
  Plays a game of nim
  AKA "sugar packet game"

  Created during Coronacation 2020
  Jason Barnett
 */

import'package:flutter/material.dart';
import 'game.dart';
import 'select_screen.dart';
import 'settings.dart';
import 'tutorial.dart';
import 'difficulty_select.dart';
import 'globals.dart' as globals;

void main() => runApp(Start());



class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/game1": (context) => Nim(layout: [1,2,3,4,5]),
        "/select": (context) => Select(),
        "/settings": (context) => Settings()
      },
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double  screenHeight = MediaQuery.of(context).size.height;
    double  screenWidth = MediaQuery.of(context).size.width;

    Color textBorderColor = Color(0xff20b07c);


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white]
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                      "NIM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 160,
                      color: Colors.grey[800],
                    )
                  ),
                ),

                SizedBox(height: 100),

                ButtonTheme(
                  height: screenHeight / 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20)
                  ),
                  child: OutlineButton(
                    borderSide: BorderSide(
                        color: textBorderColor,
                        width: 5
                    ),
                    color: Colors.white,

                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: MediaQuery.of(context).size.height / 25, fontWeight: FontWeight.w500, color: textBorderColor),
                        children: [

                          WidgetSpan(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.face,
                                  size: MediaQuery.of(context).size.height / 18,
                                  color: Colors.grey[800],
                                ),
                              )
                          ),
                          TextSpan(text: "VS"),
                          WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                  Icons.face,
                                size: MediaQuery.of(context).size.height / 18,
                                color: Colors.grey[800],
                              ),
                            )
                          )
                        ]
                      )
                    ),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Select(vsComputer: false)
                          )
                      );
                    },
                  ),
                ),


                SizedBox(height: 20),

                SizedBox(height: 20),

                ButtonTheme(
                  height: screenHeight / 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20)
                  ),
                  child: OutlineButton(
                    borderSide: BorderSide(
                        color: textBorderColor,
                        width: 5
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Icon(
                          Icons.help_outline,
                        size: MediaQuery.of(context).size.height / 18,
                      )
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tutorial()
                          )
                      );
                    },
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}

