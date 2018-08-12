import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:urra/Posts/evento.dart';
import 'package:urra/servi%C3%A7os/FireBaseUser.dart';

class StateContainer extends InheritedWidget {
  final FireBaseUser fireBaseUser = new FireBaseUser();

  /*final eventosContainer = new BehaviorSubject<List<Evento>>();

  Function (List<Evento>) get setEventos => eventosContainer.sink.add;
  List<Evento> get getEventos => eventosContainer.value;*/

  StateContainer({
    Widget child,
  }) : super(child: child);

  static StateContainer of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(StateContainer);
  }

  @override
  bool updateShouldNotify(StateContainer oldWidget) => true;

 /* void dispose (){
    eventosContainer.close();
  }*/


}
