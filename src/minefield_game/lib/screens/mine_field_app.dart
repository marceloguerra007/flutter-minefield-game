import 'package:flutter/material.dart';
import 'package:minefield_game/components/board_widget.dart';
import 'package:minefield_game/components/result_widget.dart';
import 'package:minefield_game/models/board.dart';
import 'package:minefield_game/models/explosion_exception.dart';
import '../models/field.dart';

class MineFieldApp extends StatefulWidget {
  const MineFieldApp({ Key? key }) : super(key: key);

  @override
  _MineFieldAppState createState() => _MineFieldAppState();
}

class _MineFieldAppState extends State<MineFieldApp> {
  bool _winned = false;
  bool _lose = false;
  Board _board = Board(lines: 1, columns: 1, bombsAmount: 0);
  
  void _resetGame(){
    setState(() {
      _winned = false;
      _lose = false;
      _board.reset();      
    });
  }

  void _open(Field field){
    print('abrir $_winned');
    if (!_winned){
      setState(() {
        try {
          field.open();
          
          print('dentro try $_winned');

          if (_board.resolved){
            _winned = true;
            _lose = false;
          }
        } on Explosion_Exception {
          _winned = false;
          _lose = true;
          _board.revealBombs();
        }
      });
    }
  }

  void _switchMark(Field field){
    setState(() {
      field.switchMark();
      
      if (_board.resolved){
        _winned = true;
        _lose = false;
      }
    });
  }

  Board _getBoard(double width, double height){
    int amountColumns = 15;
    double fieldLenght = width / amountColumns;
    int amountLines = (height / fieldLenght).floor();

    Board board = Board(
      lines: amountLines, 
      columns: amountColumns, 
      bombsAmount: 3
    );

    if (_board.bombsAmount == 0){
      _board = board;
    }

    return _board;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(
          winned: _winned,
          lose: _lose,
          onReset: _resetGame
        ),
        body: Container(
          child: LayoutBuilder(
            builder: (ctx, constraints){
              return BoardWidget(
                board: _getBoard(constraints.maxWidth, constraints.maxHeight),
                onOpen: _open, 
                onSwitchMark: _switchMark
              );
            }
          )
        )
      ),
    );
  }
}