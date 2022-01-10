import 'package:flutter/material.dart';
import 'package:minefield_game/components/field_widget.dart';
import 'package:minefield_game/models/board.dart';
import 'package:minefield_game/models/field.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onSwitchMark;
  
  const BoardWidget({ 
    required this.board,
    required this.onOpen,
    required this.onSwitchMark
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: board.columns,
        children:
          board.fields.map((f) {
            return FieldWidget(
              field: f, 
              onOpen: onOpen, 
              onSwitchMark: onSwitchMark
            );
          }
        ).toList()
      ),
    );
  }
}