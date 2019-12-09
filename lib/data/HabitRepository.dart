import 'package:jeu/model/Habit.dart';

class HabitRepository {
  static final HabitRepository _instance = HabitRepository._internal();

  factory HabitRepository(){
    return _instance;
  }

  HabitRepository._internal();

  List<Habit> getHabits(){
    return [
      const Habit(id:'1', categoryId:'1', name:'bus',description:'desc',image:'assets/img/deplacements/bus.jpg'),
      const Habit(id:'2', categoryId:'1', name:'marcher',description:'desc',image:'assets/img/deplacements/marcher.jpg'),
      const Habit(id:'3', categoryId:'1', name:'traverser',description:'desc',image:'assets/img/deplacements/traverser.jpg'),
      const Habit(id:'4', categoryId:'1', name:'velo',description:'desc',image:'assets/img/deplacements/velo.jpg'),
      const Habit(id:'5', categoryId:'1', name:'voiture',description:'desc',image:'assets/img/deplacements/voiture.jpg'),
      
      const Habit(id:'6', categoryId:'2', name:'allumer lumiere',description:'desc',image:'assets/img/habitation/allumerlumiere.jpg'),
      const Habit(id:'7', categoryId:'2', name:'balayer',description:'desc',image:'assets/img/habitation/balayer.jpg'),
      const Habit(id:'8', categoryId:'2', name:'machine a laver',description:'desc',image:'assets/img/habitation/machinealaver.jpg'),
      const Habit(id:'9', categoryId:'2', name:'passer d\'une pièce à l\'autre',description:'desc',image:'assets/img/habitation/passerdunepiecealautre.jpg'),
      const Habit(id:'10', categoryId:'2', name:'prothèse',description:'desc',image:'assets/img/habitation/prothese.jpg'),
      const Habit(id:'11', categoryId:'2', name:'ranger son espace',description:'desc',image:'assets/img/habitation/rangersonespace.jpg'),
      const Habit(id:'12', categoryId:'2', name:'vaiselle',description:'desc',image:'assets/img/habitation/vaisselle.jpg'),

      const Habit(id:'13', categoryId:'3', name:'casque et ordinateur',description:'desc',image:'assets/img/loisirs/casqueetordi.jpg'),
      const Habit(id:'14', categoryId:'3', name:'écrire',description:'desc',image:'assets/img/loisirs/ecrire.jpg'),
      const Habit(id:'15', categoryId:'3', name:'lire',description:'desc',image:'assets/img/loisirs/lire.jpg'),
      const Habit(id:'16', categoryId:'3', name:'télévision',description:'desc',image:'assets/img/loisirs/television.jpg'),

      const Habit(id:'17', categoryId:'4', name:'boire dans une tasse',description:'desc',image:'assets/img/nutrition/boiretasse.jpg'),
      const Habit(id:'18', categoryId:'4', name:'dresser la table',description:'desc',image:'assets/img/nutrition/dresserlatable.jpg'),
      const Habit(id:'19', categoryId:'4', name:'manger au restaurant',description:'desc',image:'assets/img/nutrition/mangeraurestaurant.jpg'),
      const Habit(id:'20', categoryId:'4', name:'manger avec les mains',description:'desc',image:'assets/img/nutrition/mangeraveclesmains.jpg'),
      const Habit(id:'21', categoryId:'4', name:'préparer à manger',description:'desc',image:'assets/img/nutrition/prepareramanger.jpg'),
      const Habit(id:'22', categoryId:'4', name:'sandwich',description:'desc',image:'assets/img/nutrition/sandwich.jpg'),
      const Habit(id:'23', categoryId:'4', name:'servir des aliments',description:'desc',image:'assets/img/nutrition/serviraliments.jpg'),

      const Habit(id:'24', categoryId:'5', name:'parler à des adultes',description:'desc',image:'assets/img/relationscom/parleradesadultes.jpg'),
      const Habit(id:'25', categoryId:'5', name:'parler en communauté',description:'desc',image:'assets/img/relationscom/parlerencommunaute.jpg'),
      const Habit(id:'26', categoryId:'5', name:'téléphoner',description:'desc',image:'assets/img/relationscom/telephone.jpg'),

      const Habit(id:'27', categoryId:'6', name:'acheter',description:'desc',image:'assets/img/responsabilites/acheter.jpg'),

      const Habit(id:'28', categoryId:'7', name:'se brosser les cheveux',description:'desc',image:'assets/img/soinspersonnels/brossercheveux.jpg'),
      const Habit(id:'29', categoryId:'7', name:'mettre les chaussures',description:'desc',image:'assets/img/soinspersonnels/chaussures.jpg'),
      const Habit(id:'30', categoryId:'7', name:'dormir',description:'desc',image:'assets/img/soinspersonnels/dormir.jpg'),
      const Habit(id:'31', categoryId:'7', name:'se doucher',description:'desc',image:'assets/img/soinspersonnels/douche.jpg'),
      const Habit(id:'32', categoryId:'7', name:'habits sales',description:'desc',image:'assets/img/soinspersonnels/habitssales.jpg'),
      const Habit(id:'33', categoryId:'7', name:'se laver les cheveux',description:'desc',image:'assets/img/soinspersonnels/lavercheveux.jpg'),
      const Habit(id:'34', categoryId:'7', name:'se laver les mains',description:'desc',image:'assets/img/soinspersonnels/laverlesmains.jpg'),
      const Habit(id:'35', categoryId:'7', name:'prendre des vêtements',description:'desc',image:'assets/img/soinspersonnels/prendrevetements.jpg'),
      const Habit(id:'36', categoryId:'7', name:'se brosser les dents',description:'desc',image:'assets/img/soinspersonnels/sebrosserlesdents.jpg'),
      const Habit(id:'37', categoryId:'7', name:'sécher ses cheveux',description:'desc',image:'assets/img/soinspersonnels/secherlescheveux.jpg'),
      const Habit(id:'38', categoryId:'7', name:'se lever',description:'desc',image:'assets/img/soinspersonnels/selever.jpg'),
      const Habit(id:'39', categoryId:'7', name:'se moucher',description:'desc',image:'assets/img/soinspersonnels/semoucher.jpg'),
      const Habit(id:'40', categoryId:'7', name:'s\'essuyer',description:'desc',image:'assets/img/soinspersonnels/sessuyer.jpg'),
      const Habit(id:'41', categoryId:'7', name:'s\'habiller',description:'desc',image:'assets/img/soinspersonnels/shabiller.jpg'),
      const Habit(id:'42', categoryId:'7', name:'s\'habitter à tirette',description:'desc',image:'assets/img/soinspersonnels/shabillertirette.jpg'),
      const Habit(id:'43', categoryId:'7', name:'toilettes',description:'desc',image:'assets/img/soinspersonnels/toilettes.jpg'),
      const Habit(id:'44', categoryId:'7', name:'urgences',description:'desc',image:'assets/img/soinspersonnels/urgence.jpg')
      ];
  }


}