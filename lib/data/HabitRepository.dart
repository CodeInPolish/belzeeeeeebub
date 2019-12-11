import 'package:jeu/model/Habit.dart';

class HabitRepository {
  static final HabitRepository _instance = HabitRepository._internal();
  var habits = [
      Habit(id:'1', categoryId:'1', name:'bus',description:'desc',image:'assets/img/deplacements/bus.jpg', state:0),
      Habit(id:'2', categoryId:'1', name:'marcher',description:'desc',image:'assets/img/deplacements/marcher.jpg', state:0),
      Habit(id:'3', categoryId:'1', name:'traverser',description:'desc',image:'assets/img/deplacements/traverser.jpg', state:0),
      Habit(id:'4', categoryId:'1', name:'velo',description:'desc',image:'assets/img/deplacements/velo.jpg', state:0),
      Habit(id:'5', categoryId:'1', name:'voiture',description:'desc',image:'assets/img/deplacements/voiture.jpg', state:0),
      
      Habit(id:'6', categoryId:'2', name:'allumer lumiere',description:'desc',image:'assets/img/habitation/allumerlumiere.jpg', state:0),
      Habit(id:'7', categoryId:'2', name:'balayer',description:'desc',image:'assets/img/habitation/balayer.jpg', state:0),
      Habit(id:'8', categoryId:'2', name:'machine a laver',description:'desc',image:'assets/img/habitation/machinealaver.jpg', state:0),
      Habit(id:'9', categoryId:'2', name:'passer d\'une pièce à l\'autre',description:'desc',image:'assets/img/habitation/passerdunepiecealautre.jpg', state:0),
      Habit(id:'10', categoryId:'2', name:'prothèse',description:'desc',image:'assets/img/habitation/prothese.jpg', state:0),
      Habit(id:'11', categoryId:'2', name:'ranger son espace',description:'desc',image:'assets/img/habitation/rangersonespace.jpg', state:0),
      Habit(id:'12', categoryId:'2', name:'vaiselle',description:'desc',image:'assets/img/habitation/vaisselle.jpg', state:0),

      Habit(id:'13', categoryId:'3', name:'casque et ordinateur',description:'desc',image:'assets/img/loisirs/casqueetordi.jpg', state:0),
      Habit(id:'14', categoryId:'3', name:'écrire',description:'desc',image:'assets/img/loisirs/ecrire.jpg', state:0),
      Habit(id:'15', categoryId:'3', name:'lire',description:'desc',image:'assets/img/loisirs/lire.jpg', state:0),
      Habit(id:'16', categoryId:'3', name:'télévision',description:'desc',image:'assets/img/loisirs/television.jpg', state:0),

      Habit(id:'17', categoryId:'4', name:'boire dans une tasse',description:'desc',image:'assets/img/nutrition/boiretasse.jpg', state:0),
      Habit(id:'18', categoryId:'4', name:'dresser la table',description:'desc',image:'assets/img/nutrition/dresserlatable.jpg', state:0),
      Habit(id:'19', categoryId:'4', name:'manger au restaurant',description:'desc',image:'assets/img/nutrition/mangeraurestaurant.jpg', state:0),
      Habit(id:'20', categoryId:'4', name:'manger avec les mains',description:'desc',image:'assets/img/nutrition/mangeraveclesmains.jpg', state:0),
      Habit(id:'21', categoryId:'4', name:'préparer à manger',description:'desc',image:'assets/img/nutrition/prepareramanger.jpg', state:0),
      Habit(id:'22', categoryId:'4', name:'sandwich',description:'desc',image:'assets/img/nutrition/sandwich.jpg', state:0),
      Habit(id:'23', categoryId:'4', name:'servir des aliments',description:'desc',image:'assets/img/nutrition/serviraliments.jpg', state:0),

      Habit(id:'24', categoryId:'5', name:'parler à des adultes',description:'desc',image:'assets/img/relationscom/parleradesadultes.jpg', state:0),
      Habit(id:'25', categoryId:'5', name:'parler en communauté',description:'desc',image:'assets/img/relationscom/parlerencommunaute.jpg', state:0),
      Habit(id:'26', categoryId:'5', name:'téléphoner',description:'desc',image:'assets/img/relationscom/telephone.jpg', state:0),

      Habit(id:'27', categoryId:'6', name:'acheter',description:'desc',image:'assets/img/responsabilites/acheter.jpg', state:0),

      Habit(id:'28', categoryId:'7', name:'se brosser les cheveux',description:'desc',image:'assets/img/soinspersonnels/brossercheveux.jpg', state:0),
      Habit(id:'29', categoryId:'7', name:'mettre les chaussures',description:'desc',image:'assets/img/soinspersonnels/chaussures.jpg', state:0),
      Habit(id:'30', categoryId:'7', name:'dormir',description:'desc',image:'assets/img/soinspersonnels/dormir.jpg', state:0),
      Habit(id:'31', categoryId:'7', name:'se doucher',description:'desc',image:'assets/img/soinspersonnels/douche.jpg', state:0),
      Habit(id:'32', categoryId:'7', name:'habits sales',description:'desc',image:'assets/img/soinspersonnels/habitssales.jpg', state:0),
      Habit(id:'33', categoryId:'7', name:'se laver les cheveux',description:'desc',image:'assets/img/soinspersonnels/lavercheveux.jpg', state:0),
      Habit(id:'34', categoryId:'7', name:'se laver les mains',description:'desc',image:'assets/img/soinspersonnels/laverlesmains.jpg', state:0),
      Habit(id:'35', categoryId:'7', name:'prendre des vêtements',description:'desc',image:'assets/img/soinspersonnels/prendrevetements.jpg', state:0),
      Habit(id:'36', categoryId:'7', name:'se brosser les dents',description:'desc',image:'assets/img/soinspersonnels/sebrosserlesdents.jpg', state:0),
      Habit(id:'37', categoryId:'7', name:'sécher ses cheveux',description:'desc',image:'assets/img/soinspersonnels/secherlescheveux.jpg', state:0),
      Habit(id:'38', categoryId:'7', name:'se lever',description:'desc',image:'assets/img/soinspersonnels/selever.jpg', state:0),
      Habit(id:'39', categoryId:'7', name:'se moucher',description:'desc',image:'assets/img/soinspersonnels/semoucher.jpg', state:0),
      Habit(id:'40', categoryId:'7', name:'s\'essuyer',description:'desc',image:'assets/img/soinspersonnels/sessuyer.jpg', state:0),
      Habit(id:'41', categoryId:'7', name:'s\'habiller',description:'desc',image:'assets/img/soinspersonnels/shabiller.jpg', state:0),
      Habit(id:'42', categoryId:'7', name:'s\'habitter à tirette',description:'desc',image:'assets/img/soinspersonnels/shabillertirette.jpg', state:0),
      Habit(id:'43', categoryId:'7', name:'toilettes',description:'desc',image:'assets/img/soinspersonnels/toilettes.jpg', state:0),
      Habit(id:'44', categoryId:'7', name:'urgences',description:'desc',image:'assets/img/soinspersonnels/urgence.jpg', state:0)
      ];

  factory HabitRepository(){
    return _instance;
  }

  HabitRepository._internal();

  List<Habit> getHabits(){
    return habits;
  }
  
}