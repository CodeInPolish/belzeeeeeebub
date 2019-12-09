import 'package:flutter/material.dart';
import 'package:jeu/data/CategoryRepository.dart';
import 'package:jeu/widget/CategoryItem.dart';

class GameHomePage extends StatelessWidget {
  
  final categories = new CategoryRepository().getCategories();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return new CategoryItem(categories[index]);
      },
    );
  }
}


