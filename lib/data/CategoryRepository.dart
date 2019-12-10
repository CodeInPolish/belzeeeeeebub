import 'package:jeu/model/Category.dart';

class CategoryRepository {
  static final CategoryRepository _instance = CategoryRepository._internal();

  factory CategoryRepository(){
    return _instance;
  }

  CategoryRepository._internal();

  List<Category> getCategories(){
    return [
      Category(id:'1', name:'deplacement',description:'desc',image:'assets/img/categories/deplacement.jpg'),
      Category(id:'2', name:'habitation',description:'desc',image:'assets/img/categories/habitation.jpg'),
      Category(id:'3', name:'loisirs',description:'desc',image:'assets/img/categories/loisirs.jpg'),
      Category(id:'4', name:'nutrition',description:'desc',image:'assets/img/categories/nutrition.jpg'),
      Category(id:'5', name:'relations, communication',description:'desc',image:'assets/img/categories/relationscom.jpg'),
      Category(id:'6', name:'responsabilités',description:'desc',image:'assets/img/categories/responsabilites.jpg'),
      Category(id:'7', name:'soins personnels',description:'desc',image:'assets/img/categories/soinspersonnels.jpg')
      ];
  }


}