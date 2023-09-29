import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool Oturn = true;
  List<String> displayXO = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  var myTextStyle = TextStyle(fontSize: 30, color: Colors.white);
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle:
        const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[600],
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Player O",
                          style: myNewFontWhite.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          oScore.toString(),
                          style: myNewFontWhite.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "Player X",
                          style: myNewFontWhite,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          xScore.toString(),
                          style: myNewFontWhite,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: const TextStyle(
                            color: Colors.lightGreenAccent, fontSize: 20),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (Oturn && displayXO[index] == "") {
        displayXO[index] = "o";
        filledBoxes += 1;
      } else if (!Oturn && displayXO[index] == "") {
        displayXO[index] = "x";
        filledBoxes += 1;
      }
      Oturn = !Oturn;
      _checkWinner();
    });
  }

//first row
  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
//2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      _showWinDialog(displayXO[3]);
    }
//3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      _showWinDialog(displayXO[6]);
    }
//1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
//2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      _showWinDialog(displayXO[1]);
    }
//3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    }
//diagnol 1
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      _showWinDialog(displayXO[0]);
    }
//diagnol 2
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      _showWinDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                _reset();
                Navigator.of(context).pop();
              },
              child: const Text("Play Again"),
            )
          ],
          title: const Text("DRAW"),
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            ElevatedButton(
              onPressed: () {
                _reset();
                Navigator.of(context).pop();
              },
              child: Text("Play Again"),
            )
          ],
          title: Text(winner + " is WINNER"),
        );
      },
    );
    if (winner == "o") {
      oScore += 1;
    } else if (winner == "x") {
      xScore += 1;
    }
  }

  void _reset() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
    });
    filledBoxes = 0;
  }
}
