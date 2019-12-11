import 'package:jeu/model/Game.dart';
import 'package:jeu/data/CategoryRepository.dart';
import 'package:jeu/data/HabitRepository.dart';

class GameRepository {

  static final GameRepository _instance = GameRepository._internal();
  Map<String, GameModel> gameHistoryMap;
  Map<String, GameModel> gameOpenMap;
  
  factory GameRepository(){
    return _instance;
  }

  GameRepository._internal(){
    GameModel gm = new GameModel();
    gm.addCategories(CategoryRepository().getCategories());
    gm.addHabits(HabitRepository().getHabits());
    gm.childId = '1';
    gameOpenMap = new Map();
    gameOpenMap[gm.childId] = gm;
  }

  GameModel getCurrentOpenGame(String childId){
    return gameOpenMap.values.firstWhere((i) => i.childId == childId);
  }

}