import 'package:flutter/material.dart';
import 'package:jeu/model/Habit.dart';
import 'package:jeu/page/LikeOrNotPage.dart';

class HabitItem2 extends StatefulWidget {
  HabitItem2({
    Key key,
    this.habit,
    this.child,
    this.parent
  }) : super(key : key);

  final Habit habit;
  final Widget child;
  State parent;
  
  _HabitItemState2 createState() => _HabitItemState2();
}

class _HabitItemState2 extends State<HabitItem2> {
  var highlights = [Colors.grey, Colors.green, Colors.red, Colors.lime];

  void updateState(bool newState){
    this.widget.habit.likedOrNot = newState;
    this.widget.parent.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final image = new Image(
      image: new AssetImage(widget.habit.image),
      height: 150.0,
      width: 150.0,
    );

    final name = Text(widget.habit.name);

    final description = Text(widget.habit.description);

    final item = Container(
      height: 200,
        child: Column(children: <Widget>[
          name, description, Expanded(child:image)],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 8
          )
        ),
      );

    return InkWell(child: item, onTap: () {
      _popupDialog(context, widget.habit);
    });
  }

  void _popupDialog(BuildContext context, Habit habit) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(habit.name, textAlign: TextAlign.center),
          children: <Widget>[
            Container(
              child: new Image(image: new AssetImage(habit.image),height: 300.0,width: 300.0,),
            ),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Oui')),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Non')),
          ],
        );
      }).then((val){
        if(val != null){
          setState(() {
            this.updateState(val);
          });
        }
      });
  }

}