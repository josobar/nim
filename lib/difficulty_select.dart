import'package:flutter/material.dart';
import 'game.dart';
import 'select_screen.dart';
import 'settings.dart';
import 'tutorial.dart';
import 'globals.dart' as globals;

class DifficultySelect extends StatefulWidget {

  DifficultySelect({
    Key key,
    this.vsComputer
  }) : super(key: key);

  bool vsComputer;

  @override
  _DifficultySelectState createState() => _DifficultySelectState();
}

class _DifficultySelectState extends State<DifficultySelect> {
  @override
  Widget build(BuildContext context) {

    Color textBorderColor = Color(0xff20b07c);
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(leading: IconButton(
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
            "Choose a Difficulty",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height / 25
            ),
          ),
        ),

        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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

                      child: Text(
                        "Easy",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight / 25,
                          color: Colors.grey[800],
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Select(compDifficulty: 0.3, vsComputer: widget.vsComputer)
                            )
                        );
                      },
                    ),
                  ),

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

                      child: Text(
                        "Medium",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight / 25,
                          color: Colors.grey[800],
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Select(compDifficulty: 0.5, vsComputer: widget.vsComputer)
                            )
                        );
                      },
                    ),
                  ),

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

                      child: Text(
                        "Hard",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight / 25,
                          color: Colors.grey[800],
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Select(compDifficulty: 0.8, vsComputer: widget.vsComputer)
                            )
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20,),

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

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight / 25,
                            color: Colors.grey[800],
                          ),

                          children: [
                            WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    size: MediaQuery.of(context).size.height / 18,
                                    color: Colors.grey[800],
                                  ),
                                )
                            ),
                            TextSpan(text: "Insane"),
                            WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.sentiment_very_dissatisfied,
                                    size: MediaQuery.of(context).size.height / 18,
                                    color: Colors.grey[800],
                                  ),
                                )
                            )
                          ]
                        ),
                      ),

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Select(compDifficulty: 1.0, vsComputer: widget.vsComputer)
                            )
                        );
                      },
                    ),
                  ),
                ],
              )
            ]
        )
      ),
    );
  }
}
