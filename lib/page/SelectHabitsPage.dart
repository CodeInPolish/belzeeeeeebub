import 'package:flutter/material.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/model/Category.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/HabitItem.dart';
import 'package:jeu/model/global.dart' as global;

class SelectHabitsPage extends StatefulWidget{

  final Category category;
  SelectHabitsPage({Key key, this.category}) : super(key: key);
  _SelectHabitsState createState() => _SelectHabitsState();
}

class _SelectHabitsState extends State<SelectHabitsPage> {
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
  
  Widget build(BuildContext context){

  final habits = new HabitRepository().getHabits().where((i) => i.categoryId == widget.category.id).toList();
  
  return Scaffold( 
    appBar: AppBar(
      title: Text("Sélection des habitudes"),
      actions: <Widget>[
        FlatButton(
          child: Text('Suivant'),
          onPressed: () {
            _onItemTapped(1);
          },
        )
      ],
    ),
    body: Center(child: new GridView.builder(
      itemCount: habits.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (context, index) {
        return new HabitItem(habit : habits[index]);
      }
      )
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