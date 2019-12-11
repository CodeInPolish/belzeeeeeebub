import 'package:flutter/material.dart';
import 'package:jeu/data/GameRepository.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/page/NeedHelpOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/HabitItemSatisfied.dart';
import 'package:jeu/model/global.dart' as global;

class SatisfiedOrNotPage extends StatefulWidget {

  SatisfiedOrNotState createState() => SatisfiedOrNotState();
}

class SatisfiedOrNotState extends State<SatisfiedOrNotPage> {
  var _selectedHabits;
  @override
  void initState() {
    _selectedHabits = GameRepository().getCurrentOpenGame("1").getHabits().where((i) => i.state == 1 || i.state == 3).toList();
    super.initState();
  }

   int _selectedIndex = global.appBarIndexSelected;

   void _onItemTapped(int index) {
    var pages = [GameHomePage(), LikeOrNotPage(), NeedHelpOrNotPage(), SatisfiedOrNotPage(), SummaryPage()];

    setState(() {
      if(global.previousState != _selectedIndex){
        global.previousState = _selectedIndex;
      }
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    var _noActionTaken = _selectedHabits.where((i) => i.satisfiedOrNot == null).toList();
    var _satisfied = _selectedHabits.where((i) => i.satisfiedOrNot == true).toList();
    var _notSatisfied = _selectedHabits.where((i) => i.satisfiedOrNot == false).toList();

    BoxDecoration columnDecoration = 
      BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black
        )
    );

    Widget _noActionTakenLabel = Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
        width: 2,
        color: Colors.black
        )
      ),
      width: double.infinity,
      child: Center(
        child: Text("En attente d'action", textAlign: TextAlign.center,),
      )
    );

    Widget _satisfiedLabel = Container( 
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
        width: 2,
        color: Colors.black
        )
      ),
      child:SizedBox(
        child: new Image(
          image: new AssetImage('assets/img/labels/happyface.jpg'),
      ),
      height: 150
      )
    );
  
    Widget _notSatisfiedLabel = Container( 
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
        width: 2,
        color: Colors.black
        )
      ),
      child:SizedBox(
        child: new Image(
          image: new AssetImage('assets/img/labels/sadface.jpg'),
        ),
      height: 150
      )
    );

    Widget _noActionTakenWidget = Expanded(
      child: Container(
        decoration: columnDecoration,
        child: ListView.builder(
          itemCount: _noActionTaken.length,
          itemBuilder: (context, index) {
            return new HabitItemSatisfied(habit:_noActionTaken[index], parent: this);
          },
        )
      )
    );

    Widget _satisfiedWidget = Expanded(
      child: Container(
        decoration: columnDecoration,
        child: ListView.builder(
          itemCount: _satisfied.length,
          itemBuilder: (context, index) {
            return new HabitItemSatisfied(habit:_satisfied[index], parent: this);
          },
        )
      )
    );

    Widget _notSatisfiedWidget = Expanded(
      child: Container(
        decoration: columnDecoration,
        child: ListView.builder(
          itemCount: _notSatisfied.length,
          itemBuilder: (context, index) {
            return new HabitItemSatisfied(habit:_notSatisfied[index], parent: this);
          },
        )
      )
    );

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
      body:Container(
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _noActionTakenLabel,
                    _noActionTakenWidget
                  ],
                )  
              )
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _satisfiedLabel,
                    _satisfiedWidget
                  ],
                )  
              )
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _notSatisfiedLabel,
                    _notSatisfiedWidget
                  ],
                )  
              )
            ),
          ]
        ),
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