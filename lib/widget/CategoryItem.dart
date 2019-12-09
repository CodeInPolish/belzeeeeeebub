import 'package:flutter/material.dart';
import 'package:jeu/SelectedCategory.dart';
import 'package:jeu/model/Category.dart';

class CategoryItem extends StatelessWidget {

  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) { 

  final image = new Image(
    image: new AssetImage(category.image),
    height: 600.0,
    width: 200.0,
  );

  final name = new Text(category.name, textAlign: TextAlign.center);

  final description = new Text(category.description, textAlign: TextAlign.center);

    return Card(
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
  }
}