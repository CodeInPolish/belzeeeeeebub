import 'package:flutter/material.dart';
import 'package:jeu/data/GameRepository.dart';
import 'package:jeu/page/GameHomePage.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/page/SatisfiedOrNot.dart';
import 'package:jeu/page/SummaryPage.dart';
import 'package:jeu/widget/HabitItemHelp.dart';
import 'package:jeu/model/global.dart' as global;

class NeedHelpOrNotPage extends StatefulWidget {

  NeedHelpOrNotState createState() => NeedHelpOrNotState();
}

class NeedHelpOrNotState extends State<NeedHelpOrNotPage> {
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
      _selectedIndex = index;
      global.appBarIndexSelected = index;
      Navigator.push(context, 
                MaterialPageRoute(builder: (context) => pages[_selectedIndex]));
    });
  }
 
  @override
  Widget build(BuildContext context) {
    var _noActionTaken = _selectedHabits.where((i) => i.needHelpOrNot == null).toList();
    var _needHelp = _selectedHabits.where((i) => i.needHelpOrNot == true).toList();
    var _noNeedHelp = _selectedHabits.where((i) => i.needHelpOrNot == false).toList();

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

    Widget _needHelpLabel = Container( 
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
          image: new AssetImage('assets/img/labels/needhelp.png'),
      ),
      height: 150
      )
    );

    Widget _noHelpNeededLabel = Container( 
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
          image: new AssetImage('assets/img/labels/noneedhelp.png'),
        ),
      height: 150
      )
    );

    Widget _noActionTakenWidget =  Expanded(
      child: Container(
        decoration: columnDecoration,
        child:ListView.builder(
          itemCount: _noActionTaken.length,
          itemBuilder: (context, index) {
            return new HabitItemHelp(habit:_noActionTaken[index], parent: this);
          }
        )
      )
    );
    
    Widget _needHelpWidget =  Expanded(
      child: Container(
        decoration: columnDecoration,
        child:ListView.builder(
          itemCount: _needHelp.length,
          itemBuilder: (context, index) {
            return new HabitItemHelp(habit:_needHelp[index], parent: this);
          },
        )
      )
    );

    Widget _noHelpNeededWidget =  Expanded(
      child: Container(
        decoration: columnDecoration,
        child:ListView.builder(
          itemCount: _noNeedHelp.length,
          itemBuilder: (context, index) {
            return new HabitItemHelp(habit:_noNeedHelp[index], parent: this);
          },
        )
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Besoin d'aide ou pas"),
        actions: <Widget>[
        FlatButton(
          child: Text('Suivant'),
          onPressed: () {
            _onItemTapped(3);
          },
        )
      ],
      ),
      body: Container(
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
                    _needHelpLabel,
                    _needHelpWidget
                  ],
                )  
              )
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _noHelpNeededLabel,
                    _noHelpNeededWidget
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
          title: Text('Besoin d\'aide'),
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