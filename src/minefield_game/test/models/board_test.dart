import 'package:flutter_test/flutter_test.dart';
import 'package:minefield_game/models/board.dart';

main(){

  test('Win the game', (){
    Board board = Board(
      lines: 2, 
      columns: 2, 
      bombsAmount: 0);    
  
    board.fields[0].setMine();
    board.fields[3].setMine();

    //Play
    board.fields[0].switchMark();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].switchMark();

    expect(board.resolved, isTrue);
  });

  
}