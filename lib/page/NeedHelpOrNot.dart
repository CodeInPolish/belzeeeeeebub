import 'package:flutter/material.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/widget/HabitItem2.dart'; //remettre l'import pour tester les listview

class NeedHelpOrNotPage extends StatefulWidget {

  NeedHelpOrNotState createState() => NeedHelpOrNotState();
}

class NeedHelpOrNotState extends State<NeedHelpOrNotPage> {
  var _selectedHabits;
  @override
  void initState() {
    _selectedHabits = HabitRepository().getHabits().where((i) => i.state == 1 || i.state == 3).toList();
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    var _noActionTaken = _selectedHabits.where((i) => i.needHelpOrNot == null).toList();
    var _liked = _selectedHabits.where((i) => i.needHelpOrNot == true).toList();
    var _notLiked = _selectedHabits.where((i) => i.needHelpOrNot == false).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Besoin d'aide ou pas"),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _noActionTaken.length,
                itemBuilder: (context, index) {
                  return new HabitItem2(habit:_noActionTaken[index], parent: this); //crash je sais pas pk
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _liked.length,
                itemBuilder: (context, index) {
                  return new HabitItem2(habit:_liked[index], parent: this);
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _notLiked.length,
                itemBuilder: (context, index) {
                  return new HabitItem2(habit:_notLiked[index], parent: this);
                },
              )
            )
          ]
        ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
         Navigator.push(context, 
            MaterialPageRoute(builder: (context) => SatisfiedOrNotPage()));
      },
      label: Text('Approve'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.pink,
      )
    );
  }

}