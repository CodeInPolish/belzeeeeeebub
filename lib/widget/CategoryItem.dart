import 'package:flutter/material.dart';
import 'package:jeu/page/SelectHabitsPage.dart';
import 'package:jeu/model/Category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) { 

  final image = new Image(
    image: new AssetImage(category.image),
    height: 600.0,
    width: 600.0,
  );

  final name = new Text(category.name, textAlign: TextAlign.center);

  final description = new Text(category.description, textAlign: TextAlign.center);

  final item = new Container(
    height: 300,
    child:Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child:image
        ),
        Expanded(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              name,
              description
            ],
          )
        )
      ],
      )
  );

    return InkWell(
      child: item,
      onTap: () {
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => SelectHabitsPage(category : category)));
          }
    ); 
    
    
    /* Card(
      child: ListTile(
        leading: Container(child: image, width: 200),
        title: name,
        subtitle: description,
        isThreeLine: true,
        onTap: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => SelectedCategory(category : category)));
        },
      ), 
      );
      */
  }
}