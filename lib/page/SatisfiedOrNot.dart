import 'package:flutter/material.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/HabitItemSatisfied.dart'; //remettre l'import pour tester les listview
import 'package:jeu/model/global.dart' as global;

class SatisfiedOrNotPage extends StatefulWidget {

  SatisfiedOrNotState createState() => SatisfiedOrNotState();
}

class SatisfiedOrNotState extends State<SatisfiedOrNotPage> {
  var _selectedHabits;
  @override
  void initState() {
    _selectedHabits = HabitRepository().getHabits().where((i) => i.state == 1 || i.state == 3).toList();
    super.initState();
  }

   int _selectedIndex = global.appBarIndexSelected;

   void _onItemTapped(int index) {
    var pages = [GameHomePage(), LikeOrNotPage(), NeedHelpOrNotPage(), SatisfiedOrNotPage(), SummaryPage()];

    setState(() {
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }
 
  @override
  Widget build(BuildContext context) {
    var _noActionTaken = _selectedHabits.where((i) => i.satisfiedOrNot == null).toList();
    var _liked = _selectedHabits.where((i) => i.satisfiedOrNot == true).toList();
    var _notLiked = _selectedHabits.where((i) => i.satisfiedOrNot == false).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Satisfait ou pas"),
        actions: <Widget>[
        FlatButton(
          child: Text('Suivant'),
          onPressed: () {
            _onItemTapped(4);
          },
        )
      ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _noActionTaken.length,
                itemBuilder: (context, index) {
                  return new HabitItemSatisfied(habit:_noActionTaken[index], parent: this); //crash je sais pas pk
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _liked.length,
                itemBuilder: (context, index) {
                  return new HabitItemSatisfied(habit:_liked[index], parent: this);
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: _notLiked.length,
                itemBuilder: (context, index) {
                  return new HabitItemSatisfied(habit:_notLiked[index], parent: this);
                },
              )
            )
          ]
        ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.amber[800],
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Catégories'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('J\'aime'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          title: Text('Besoin aide'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sentiment_satisfied),
          title: Text('Satisfait'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_all),
          title: Text('Synthèse'),
        )
      ],
    ),
    );
  }

}