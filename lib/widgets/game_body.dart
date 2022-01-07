import 'package:flutter/material.dart';

class GameBody extends StatelessWidget {
  const GameBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: ColumnValues(),
        ),
      ),
    );
  }

  List<Widget> ColumnValues() {
    List<Widget> columnList = [];
    for (int i = 0; i < 6; i++) {
      columnList.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: RowValues(i),
      ));
    }
    return columnList;
  }

  List<Widget> RowValues(int index) {
    List<Widget> rowList = [];
    for (int i = 0; i < 6; i++) {
      rowList.add(Container(
        margin: EdgeInsets.all(10),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
        ),
      ));
    }
    return rowList;
  }
}
