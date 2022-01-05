import 'package:flutter/material.dart';
import 'package:minefield_game/components/result_widget.dart';

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({ Key? key }) : super(key: key);

  void _resetGame(){
    print('Reiniciar o jogo');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultWidget(onReset: _resetGame),        
        body: Container(
          child: Text('Tabuleiro')
        ),
      ),
    );
  }
}