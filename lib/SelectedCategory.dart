import 'package:flutter/material.dart';
import 'package:jeu/model/Category.dart';
import 'package:jeu/data/HabitRepository.dart';
import 'package:jeu/widget/HabitItem.dart';

class SelectedCategory extends StatelessWidget{

  final Category category;
  SelectedCategory({Key key, this.category}) : super(key: key);

  Widget build(BuildContext context){
    final habits = new HabitRepository().getHabits().where((i) => i.categoryId == category.id).toList();
    
    return Scaffold(  
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
        // Add your onPressed code here!
      },
      label: Text('Approve'),
      icon: Icon(Icons.thumb_up),
      backgroundColor: Colors.pink,
    ),
    );
  }
}