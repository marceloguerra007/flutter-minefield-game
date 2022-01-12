import 'dart:math';

import 'field.dart';

class Board{
  final int lines;
  final int columns;
  final int bombsAmount;

  final List<Field> _fields = [];

  Board({
    required this.lines,
    required this.columns,
    required this.bombsAmount
  }){
    _createFields();
    _connectNeighbors();
    _raffleMines();
  }

  void _createFields() {
    for(int l = 0; l < lines; l++){
      for (int c = 0; c < columns; c++){
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _connectNeighbors() {
    for (var field in _fields){
      for (var neighbor in _fields){
        field.addNeighbor(neighbor);
      }
    }
  }

  void _raffleMines() {
    int raffled = 0;

    if (bombsAmount > lines * columns)
      return;

    while (raffled < bombsAmount){
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].mined){
        raffled++;
        _fields[i].setMine();
      }
    }
  }

  void reset(){
    _fields.forEach((f) => f.reset());

    _raffleMines();
  }

  void revealBombs(){
    _fields.forEach((f) => f.revealBomb());
  }

  List<Field> get fields{
    return _fields;
  }

  bool get resolved{
    return _fields.every((f) => f.resolved);
  }
}