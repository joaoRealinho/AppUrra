import 'package:flutter/material.dart';
import 'package:urra/Eventos_List.dart';
import 'package:urra/servi%C3%A7os/StateContainer.dart';

class MainPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final StateContainer container = StateContainer.of(context);

    return new DefaultTabController(
        length: 4,
        child: new Scaffold(
          appBar: new AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('images/urra.gif', fit: BoxFit.contain),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.mail_outline,
                  color: Color.fromRGBO(255, 255, 255, 0.7),
                ),
                onPressed: null,
                highlightColor: Colors.white,
              )
            ],
            backgroundColor: Color.fromRGBO(0, 153, 0, 1.0),
            bottom: new TabBar(indicatorColor: Colors.white, tabs: [
              new Tab(icon: new Icon(Icons.event_note)),
              new Tab(icon: new Icon(Icons.notification_important)),
              new Tab(icon: new Icon(Icons.wallpaper)),
              new Tab(icon: new Icon(Icons.business_center))
            ]),
          ),
          body: new TabBarView(children: [
            new EventosList(),
            new Text(container.fireBaseUser.user.displayName),
            new Icon(Icons.directions_bike),
            new Icon(Icons.directions_car),
          ]),
        ));
  }
}
