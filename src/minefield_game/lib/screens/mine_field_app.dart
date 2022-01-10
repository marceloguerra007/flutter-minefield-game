import 'package:flutter/material.dart';
import 'package:minefield_game/components/board_widget.dart';
import 'package:minefield_game/components/result_widget.dart';
import 'package:minefield_game/models/board.dart';
import '../components/field_widget.dart';
import '../models/field.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({ Key? key }) : super(key: key);

  void _resetGame(){
    print('Reiniciar o jogo');
  }

  void _open(Field field){
    print('abrir');    
  }

  void _switchMark(Field field){
    print('Alternar Marcação');
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(onReset: _resetGame),        
        body: Container(
          child: BoardWidget(
            board: Board(
              lines: 5, 
              columns: 5,
              bombsAmount: 3
            ),
            onOpen: _open, 
            onSwitchMark: _switchMark
          ),
        )
      ),
    );
  }
}