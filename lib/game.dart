
import'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'globals.dart' as globals;
import 'select_screen.dart';
import 'main.dart';
import 'settings.dart';
import 'dart:async';

class Nim extends StatefulWidget {

  Nim({
    Key key,
    this.layout,
    this.vsComputer,
    this.compDifficulty
  }) : super(key: key);

  var layout;
  double compDifficulty;
  bool vsComputer;

  @override
  _NimState createState() => _NimState();
}

class _NimState extends State<Nim> {

  @override
  Widget build (BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;

    return MaterialApp(

      routes: {
        "/select" : (context) => Select()
      },
      home: Scaffold(
          backgroundColor: Colors.white,

          body: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                  child: buildBoard(widget.layout),
                ),
                ConfirmButton(leftTurn: true, gameOver: false, vsComputer: widget.vsComputer)
              ]
          ),
      )
    );
  }
}

class ConfirmButton extends StatefulWidget {

  ConfirmButton({
    Key key,
    this.leftTurn,
    this.gameOver,
    this.vsComputer
  }) : super(key: key);

  bool vsComputer;
  bool leftTurn;
  bool gameOver;

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {

  Icon leftArrow = Icon(Icons.arrow_back, color: Colors.blue, size: 100); // CHANGE DUE TO ASPECT RATIO
  Icon rightArrow = Icon(Icons.arrow_forward, color: Colors.red, size: 100); // CHANGE DUE TO ASPECT RATIO
  
  Widget winMessage = Container();
  Widget playAgainButton = Container();

  String buttonMessage = "End Turn";

  @override
  Widget build(BuildContext context) {



    return Column(
      children: <Widget>[

        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.face,
                  size: MediaQuery.of(context).size.height / 11,
                ),
              ),

              WidgetSpan(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 15,
                )
              ),

              WidgetSpan(
                  child: widget.leftTurn ? leftArrow : rightArrow
              ),

              WidgetSpan(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  )
              ),

              WidgetSpan(
                child: Icon(
                  widget.vsComputer ? Icons.computer : Icons.face,
                  size: MediaQuery.of(context).size.height / 11,
                ),
              )
            ]
          ),
        ),

        winMessage,
        Divider(
          color:Colors.black,
          height: 20
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width,
            child: OutlineButton(
              padding: EdgeInsets.all(30),
              borderSide: BorderSide(
                color: Colors.grey[600],
                width: 5
              ),
              child: Text(
                buttonMessage,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30
                ),
              ),

              onPressed: () {
                if(!widget.gameOver) {
                  var allTiles = globals.tiles;
                  var selectedTiles = [];
                  for (int i = 0; i < allTiles.length; i++) {
                    if (allTiles[i].isSelected) {
                      selectedTiles += [allTiles[i]];
                    }
                  }

                  bool followedRules = true;
                  for (int i = 1; i < selectedTiles.length; i++) {
                    if (selectedTiles[i].getRow != selectedTiles[i - 1].getRow) {
                      followedRules = false;
                    }
                  }

                  // user does not select any tiles
                  if (selectedTiles.length == 0) {
                    followedRules = false;
                  }

                  int tilesRemaining = 0;
                  for (int i = 0; i < allTiles.length; i++) {
                    if (allTiles[i].isEnabled) {
                      tilesRemaining++;
                    }
                  }

                  // user tries to remove all tiles
                  if ((tilesRemaining - selectedTiles.length) <= 0) {
                    followedRules = false;
                  }

                  print("Followed rules " + "${followedRules}");
                  print("\n");
                  if (followedRules) {
                    for (int i = 0; i < selectedTiles.length; i++) {
                      selectedTiles[i].setEnabled(false);
                      selectedTiles[i].setSelected(false);

                      int tilesRemaining = 0;
                      for (int i = 0; i < allTiles.length; i++) {
                        if (allTiles[i].isEnabled) {
                          tilesRemaining++;
                        }
                      }

                      if (tilesRemaining == 1) {
                        setState(() {
                          widget.gameOver = true;
                          buttonMessage = "Play Again";
                          winMessage = Text("WINS!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30));
                          widget.leftTurn = !widget.leftTurn;
                        });
                      }
                    }

                    for(int i = 0; i < allTiles.length; i++) {
                      print("${allTiles[i].isEnabled}");
                    }

                    print("\n");

                    for(int i = 0; i < allTiles.length; i++) {
                      print("${globals.tiles[i].isEnabled}");
                    }

                    setState(() {
                      widget.leftTurn = !widget.leftTurn;
                    });
                  }
                  selectedTiles = [];

                  // TESTING
                  if(widget.vsComputer) {

                    allTiles[0].setEnabled(false);

                  }
                  print("VS computer: " + "${widget.vsComputer}");
                  // TESTING

                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Start()
                    )
                  );
                }
              },
            ),
          ),
        ),
        !widget.gameOver ? ButtonTheme(
          child: RaisedButton(
            color: Colors.grey[500],
            child: Text(
              "Quit",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Start()
                )
              );
            },
          ),
        ) : Text("")
      ],
    );
  }

  int getNimSum(var layout) {

    int nimSum = layout[0];
    for(int i = 1; i < layout.length; i++) {
      nimSum = nimSum ^ layout[i];
    }
    return nimSum;
  }

  void makeMove() {
    List<Widget> tiles = globals.tiles;



  }
}


Widget buildBoard(var layout) {

  List<Widget> board = [];
  List<Widget> rowChildren = [];
  globals.tiles = [];

  int longestRowLength = 0;
  for(int i = 0; i < layout.length; i++) {
    if(layout[i] > longestRowLength) longestRowLength = layout[i];
  }

  for(int i = 0; i < layout.length; i++) {
    for(int k = 0; k < layout[i]; k++) {
      Tile newTile = Tile(row: i, enabled: true, selected: false);
      rowChildren += [newTile, SizedBox(width: 5)];
      globals.tiles += [newTile];
    }
    Row newRow = Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: rowChildren
    );
    rowChildren = [];
    board += [newRow];
    board += [SizedBox(height: 10)]; // CHANGE DUE TO ASPECT RATIO
  }

  return Column(
    children: board,
  );
}

class Tile extends StatefulWidget {

  Tile({
    Key key,
    this.row,
    this.enabled,
    this.selected
  }) : super(key: key);

  int row;
  bool enabled;
  bool selected;
  Color color = Color(0xff20b07c);

  int get getRow => row;

  bool get isEnabled => enabled;

  void setEnabled(bool newEnabled) {
    enabled = newEnabled;
  }

  bool get isSelected => selected;

  void setSelected(bool newSelected) {
    color = Colors.grey[500];
    selected = newSelected;
  }

  void setColor(Color newColor) {
    color = newColor;
  }


  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {

  final ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Color(0xff20b07c));

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;

    return ButtonTheme(
      minWidth: screenWidth / 8.5,
      height: screenHeight / 5.5,
      buttonColor: widget.color, // Make a different color for dead tiles
      child: RaisedButton(
        onPressed: () {
          if(widget.enabled) {
            setState(() {
              widget.setSelected(!widget.selected);
              !widget.selected ? widget.setColor(Color(0xff20b07c)) : widget.setColor(Colors.grey[500]);
              }
            );
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(13.0),
         ),
      ),
    );
  }
}

//validateRules(List<Widget> tiles) {
//
//  bool followedRules = true;
//  for (int i = 1; i < tiles.length; i++) {
//
//    // Checks if there are tiles selected that are in different rows
//    if (tiles[i].getRow != tiles[i - 1].getRow) {
//      followedRules = false;
//    }
//  }
//
//  return followedRules;
//}


