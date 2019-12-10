import 'package:flutter/material.dart';
import 'package:jeu/page/LikeOrNotPage.dart';
import 'package:jeu/model/Category.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/widget/HabitItem.dart';

class SelectHabitsPage extends StatelessWidget{

  final Category category;
  SelectHabitsPage({Key key, this.category}) : super(key: key);

  Widget build(BuildContext context){
    final habits = new HabitRepository().getHabits().where((i) => i.categoryId == category.id).toList();
    
    return Scaffold( 
      appBar: AppBar(
        title: Text("Sélection des habitudes"),
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
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
         Navigator.push(context, 
            MaterialPageRoute(builder: (context) => LikeOrNotPage()));
      },
      label: Text('Approve'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.pink,
    ),
    );
  }
}