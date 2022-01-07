import 'package:connect4_flutter/utilities/board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameBody extends StatelessWidget {
  const GameBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final board = Provider.of<Board>(context, listen: false);
    board.createBoard();
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: ColumnValues(context),
        ),
      ),
    );
  }

  List<Widget> ColumnValues(BuildContext context) {
    List<Widget> columnList = [];
    for (int i = 0; i < 6; i++) {
      columnList.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: RowValues(context, i),
      ));
    }
    return columnList;
  }

  List<Widget> RowValues(BuildContext context, int index) {
    final board = Provider.of<Board>(context);
    List<Widget> rowList = [];
    for (int i = 0; i < 7; i++) {
      if (board.printBoard(board.board)[index][i].toInt() == 0) {
        rowList.add(GestureDetector(
          onTap: () {
            if (!board.gameOver) {
              if (board.turn == board.playerTurn) {
                board.playerMakeMove(index, i);
              }
            }
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ));
      } else if (board.printBoard(board.board)[index][i].toInt() == 1) {
        rowList.add(GestureDetector(
          onTap: () {
            print("Selected $i ");
            board.playerMakeMove(index, i);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ));
      } else if (board.printBoard(board.board)[index][i].toInt() == 2) {
        rowList.add(GestureDetector(
          onTap: () {
            print("Selected $i ");
            board.playerMakeMove(index, i);
          },
          child: Container(
            margin: EdgeInsets.all(10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ));
      }
    }
    return rowList;
  }
}
