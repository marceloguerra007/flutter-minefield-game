import 'package:flutter/material.dart';
import 'package:minefield_game/components/result_widget.dart';
import 'package:minefield_game/models/explosion_exception.dart';
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
    Field field = Field(line: 1, column: 1);
    Field f2 = Field(line: 1, column: 2);
    f2.setMine();
    field.addNeighbor(f2);

    try {
        //field.setMine();
        field.open();
    } on Explosion_Exception {
    }

    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(onReset: _resetGame),        
        body: Container(
          child: FieldWidget(
            field: field,
            onOpen: _open,
            onSwitchMark: _switchMark,
            )
        ),
      ),
    );
  }
}