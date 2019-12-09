import 'package:flutter/material.dart';
import 'package:jeu/model/Habit.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/widget/HabitItem.dart';

class SelectedHabit extends StatelessWidget{

  final Habit habit;
  SelectedHabit({Key key, this.habit}) : super(key: key);

  Widget _padDialog() => SimpleDialog(
        title: Text(
          "Do you know why?",
          textAlign: TextAlign.center,
        ),
        titlePadding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: <Widget>[
            Row(children: <Widget>[
              Text("oui"), Text("non"), Text("maybe")
            ])
        ],
        contentPadding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
      );

  Widget build(BuildContext context){
    final dialogCard = Text("dialog"); 

    return _padDialog();
  }
}