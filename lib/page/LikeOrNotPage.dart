import 'package:flutter/material.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/HabitItemLike.dart'; //remettre l'import pour tester les listview
import 'package:jeu/model/global.dart' as global;

class LikeOrNotPage extends StatefulWidget {

  LikeOrNotState createState() => LikeOrNotState();
}

class LikeOrNotState extends State<LikeOrNotPage> {
  
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
    var _noActionTaken = _selectedHabits.where((i) => i.likedOrNot == null).toList();
    var _liked = _selectedHabits.where((i) => i.likedOrNot == true).toList();
    var _notLiked = _selectedHabits.where((i) => i.likedOrNot == false).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("J'aime ou pas"),
        actions: <Widget>[
        FlatButton(
          child: Text('Suivant'),
          onPressed: () {
            _onItemTapped(2);
          },
        )
      ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Expanded(
              child:ListView.builder(
                itemCount: _noActionTaken.length,
                itemBuilder: (context, index) {
                  return new HabitItemLike(habit:_noActionTaken[index], parent: this); //crash je sais pas pk
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                itemCount: _liked.length,
                itemBuilder: (context, index) {
                  return new HabitItemLike(habit:_liked[index], parent: this);
                },
              )
            ),
            Expanded(
              child:ListView.builder(
                itemCount: _notLiked.length,
                itemBuilder: (context, index) {
                  return new HabitItemLike(habit:_notLiked[index], parent: this);
                },
              )
            )
          ]
        ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Catégories'),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('J\'aime'),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          title: Text('Besoin aide'),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sentiment_satisfied),
          backgroundColor: Colors.blue,
          title: Text('Satisfait'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done_all),
          title: Text('Synthèse'),
          backgroundColor: Colors.blue,
        )
      ],
    ),
    );
  }

}