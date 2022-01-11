import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  bool winned;
  bool lose;
  final Function() onReset;

  ResultWidget({ 
     this.winned = false,
     this.lose = false,
     required this.onReset
  });

  Color _getColor() {
    if (winned){
      return Colors.green[300]!;
    }else if (lose){
      return Colors.red[300]!;
    }else{
        return Colors.blue[300]!;
    }
  }

  IconData _getIcon(){
    if (winned){
      return Icons.sentiment_very_satisfied;
    }else if (lose){
      return Icons.sentiment_very_dissatisfied;
    }else{
      return Icons.sentiment_satisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(      
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(0),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35
              ),
              onPressed: onReset, 
              ),
          ) 
        )
      ),
      color: Colors.grey,
    );
  }

  @override  
  Size get preferredSize => Size.fromHeight(120);
}