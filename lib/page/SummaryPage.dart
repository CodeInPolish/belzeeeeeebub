import 'package:flutter/material.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/model/global.dart' as global;

class SummaryPage extends StatefulWidget {

  SummaryState createState() => SummaryState();
}

class SummaryState extends State<SummaryPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Synthèse"),
      ),
      body: Text("hello"),        
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
    )
    );
  }

}