import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> displayXOh = ['', '', '', '', '', '', '', '', ''];
  bool isPlayerOhTurn = true;
  int oScore = 0;
  int xScore = 0;
  int isFilled = 0;

  static var fontPressStart = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var fontPressStartWhite =
      GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 10));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Score", style: fontPressStartWhite),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Player o',
                            style: fontPressStartWhite,
                          ),
                          Text(
                            '$oScore',
                            style: fontPressStartWhite,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text(
                            'Player x',
                            style: fontPressStartWhite,
                          ),
                          Text(
                            '$xScore',
                            style: fontPressStartWhite,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _onTapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.grey[900],
                      ),
                      child: Center(
                          child: Text(
                        displayXOh[index],
                        style: const TextStyle(color: Colors.white, fontSize: 32),
                      )),
                    ),
                  );
                },
              ),
            ),
            Expanded(
                child: Text(
                  isPlayerOhTurn ? 'o\'s turn' : 'x\'s turn',
                  style: fontPressStartWhite,
                )),
          ],
        ),
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      if (displayXOh[index] == '') {
        displayXOh[index] = isPlayerOhTurn ? 'o' : 'x';
        isFilled += 1;
        isPlayerOhTurn = !isPlayerOhTurn;
        _checkWinner();
      }
    });
  }

  void _checkWinner() {
    if (displayXOh[0] == displayXOh[1] && displayXOh[0] == displayXOh[2] && displayXOh[0] != '') {
      _showDialog();
    } else if (displayXOh[3] == displayXOh[4] && displayXOh[3] == displayXOh[5] && displayXOh[3] != '') {
      _showDialog();
    } else if (displayXOh[6] == displayXOh[7] && displayXOh[6] == displayXOh[8] && displayXOh[6] != '') {
      _showDialog();
    } else if (displayXOh[0] == displayXOh[3] && displayXOh[0] == displayXOh[6] && displayXOh[0] != '') {
      _showDialog();
    } else if (displayXOh[1] == displayXOh[4] && displayXOh[1] == displayXOh[7] && displayXOh[1] != '') {
      _showDialog();
    } else if (displayXOh[2] == displayXOh[5] && displayXOh[2] == displayXOh[8] && displayXOh[2] != '') {
      _showDialog();
    } else if (displayXOh[0] == displayXOh[4] && displayXOh[0] == displayXOh[8] && displayXOh[0] != '') {
      _showDialog();
    } else if (displayXOh[2] == displayXOh[4] && displayXOh[2] == displayXOh[6] && displayXOh[2] != '') {
      _showDialog();
    } else if (isFilled == 9) {
      _showDrawDialog();
    } else {
      return;
    }
  }

  void _resetBoard() {
    setState(() {
      displayXOh = ['', '', '', '', '', '', '', '', ''];
      isPlayerOhTurn = true;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Winner'),
          content: Text('Player ${isPlayerOhTurn ? 'x' : 'o'} won'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBoard();
                isFilled = 0;
              },
            ),
          ],
        );
      },
    );

    if (!isPlayerOhTurn) {
      oScore++;
    } else {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBoard();
              },
            ),
          ],
        );
      },
    );
  }
}
