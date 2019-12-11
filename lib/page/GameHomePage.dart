import 'package:flutter/material.dart';
import 'package:jeu/data/GameRepository.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/CategoryItem.dart';
import 'package:jeu/model/global.dart' as global;

class GameHomePage extends StatefulWidget {
  
  final categories = new GameRepository().getCurrentOpenGame("1").getCategories();

  _GameHomeState createState() => _GameHomeState();  
}

class _GameHomeState extends State<GameHomePage> {
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
    var listview = ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(widget.categories[index]);
      },
    );

    return Scaffold( 
    appBar: AppBar(
      title: Text("Sélection des catégories"),
    ),
    body: Center(
      child: listview
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
          title: Text('Satisfait'),
          backgroundColor: Colors.blue,
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


