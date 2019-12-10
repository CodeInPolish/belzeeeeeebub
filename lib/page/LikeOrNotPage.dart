import 'package:flutter/material.dart';
import 'package:jeu/data/HabitRepository.dart';
//import 'package:jeu/widget/HabitItem2.dart'; remettre l'import pour tester les listview

class LikeOrNotPage extends StatefulWidget {

  _LikeOrNotState createState() => _LikeOrNotState();
}

class _LikeOrNotState extends State<LikeOrNotPage> {
  var _selectedHabits;
  @override
  void initState() {
    _selectedHabits = HabitRepository().getHabits().where((i) => i.state != 0).toList();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    var _noActionTaken = _selectedHabits.where((i) => i.likedOrNot == null).toList();
    var _liked = _selectedHabits.where((i) => i.likedOrNot == true).toList();
    var _notLiked = _selectedHabits.where((i) => i.likedOrNot == false).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("J'aime ou pas"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Expanded(
              child:ListView.builder(
                itemCount: _noActionTaken.length,
                itemBuilder: (context, index) {
                  return new Text(_noActionTaken[index].name);
                  //return new HabitItem2(habit:_noActionTaken[index]); //crash je sais pas pk
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                itemCount: _liked.length,
                itemBuilder: (context, index) {
                  return new Text(_liked[index].name);
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                itemCount: _notLiked.length,
                itemBuilder: (context, index) {
                  return new Text(_notLiked[index].name);
                },
              )
            )
          ]
        )
      );
  }

}