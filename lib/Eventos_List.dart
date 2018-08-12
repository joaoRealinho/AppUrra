import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:urra/Posts/evento.dart';


class EventosList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventosListWidget();
}


class _EventosListWidget extends State<EventosList> {

  List<Evento> eventos = new List();

  _EventosListWidget() {
    final DatabaseReference _refEventos = FirebaseDatabase.instance.reference().child('eventos');
    _refEventos.onChildAdded.listen(_onAddedChildAdded);
    _refEventos.onChildChanged.listen(_onChangedChild);
  }

  _onAddedChildAdded(e){
    DataSnapshot data = e.snapshot;
    var val = data.value;

    var item = new Evento(
        data.key,
        val["nome"],
        val["imagem"],
        val["descricao"],
        val["contato"],
        val["local"],
        val["organizadores"]);

    setState(() {
      eventos.insert(0, item);
    });
  }
  _onChangedChild(e){
    DataSnapshot data = e.snapshot;
    var val = data.value;

    var item = new Evento(
        data.key,
        val["nome"],
        val["imagem"],
        val["descricao"],
        val["contato"],
        val["local"],
        val["organizadores"]);

    var index = eventos.indexWhere((Evento) => Evento.key==item.key);
    setState(() {
      eventos[index] = item;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
        body: ListView.builder(
            itemCount: eventos.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                margin: EdgeInsets.all(10.0),
                color: Color.fromRGBO(0, 153, 0, 1.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${eventos[index].nome}',
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Text('${eventos[index].organizadores}'),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Image.network('${eventos[index].imagem}'),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${eventos[index].descricao}',
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.directions_car,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Text('${eventos[index].contato}'))
                  ],
                ),
              );
            }));
  }
}
