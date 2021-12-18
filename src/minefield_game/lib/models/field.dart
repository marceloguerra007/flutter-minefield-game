import 'dart:core';

import 'explosion_exception.dart';

class Field{
  final int line;
  final int column;
  final List<Field> neighbors = [];

  bool _marked = false;
  bool _opened = false;
  bool _mined = false;
  bool _exploded = false;  

  Field({
    required this.line,
    required this.column
  });

  void addNeighbor(Field neighbor){
    final deltaLine = (line - neighbor.line).abs();
    final deltaColumn = (column - neighbor.column).abs();

    if (deltaLine == 0 && deltaColumn == 0)
      return;

    if (deltaLine <= 1 && deltaColumn <= 1){
      neighbors.add(neighbor);
    }    
  }

  void open(){
    if (_opened)
      return;

    _opened = true;
    
    if (_mined){
      _exploded = true;
      throw Explosion_Exception();
    }

    if (safetyNeighborhood){
      neighbors.forEach((n) => n.open());
    }
  }

  void revealBomb(){
    if (_mined){
      _opened = true;
    }
  }

  void setMine(){
    _mined = true;
  }

  void switchMark(){
    _marked = !_marked;
  }

  void reset(){
    _marked = false;
    _opened = false;
    _mined = false;
    _exploded = false;
  }
  
  bool get marked {
    return _marked;
  }

  bool get opened {
    return _opened;
  }

  bool get mined {
    return _mined;
  }

  bool get exploded {
    return _exploded;
  }

  bool get resolved{
    bool minedAndMarked = _mined && marked;
    bool safetyAndOpened = !mined && opened;

    return minedAndMarked || safetyAndOpened;
  }

  bool get safetyNeighborhood{
    return neighbors.every((n) => !n.mined);
  }

  int get amountMineInNeighborhood{
    return neighbors.where((n) => n.mined).length;
  }
}