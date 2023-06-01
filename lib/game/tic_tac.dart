import 'package:flutter/material.dart';

class TicTac extends StatefulWidget {
  const TicTac({super.key});

  @override
  State<TicTac> createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  //3x3 board
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

//player can be X or O
  String player = 'X';
  String result = '';

//when a player taps on a cell
  void play(int row, int col) {
    if (board[row][col] == '') {
      setState(() {
        board[row][col] = player;
        checkWin();
        if (result == '') {
          player = player == 'X' ? 'O' : 'X';
        }
      });
    }
  }

//after every move
  void checkWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] &&
          board[1][i] == board[i][2] &&
          board[i][0] != '') {
        result = '${board[i][0]} wins';
        return;
      }
      if (board[0][i] == board[1][i] &&
          board[i][1] == board[2][i] &&
          board[0][i] != '') {
        result = '${board[0][i]} wins';
        return;
      }
    }
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '') {
      result = '${board[0][0]} wins';
      return;
    }
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '') {
      result = '${board[0][2]} wins';
      return;
    }
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return;
        }
      }
    }
    result = 'Draw!';
  }

//resets the game
  void reset() {
    setState(() {
      board = [
        ['', '', ''],
        ['', '', ''],
        ['', '', '']
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //here we draw the board
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(20.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () => play(row, col),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        color: board[row][col] == 'X'
                            ? Colors.amber
                            : board[row][col] == '0'
                                ? Colors.deepPurple
                                : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          board[row][col],
                          style: const TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          //here we display the current player
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Player $player turn',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //display the result
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              result,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: result == '' ? Colors.transparent : Colors.green,
              ),
            ),
          ),
          //and the reset button
          Container(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: reset,
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
