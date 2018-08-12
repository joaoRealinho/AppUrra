import 'package:firebase_auth/firebase_auth.dart';


class FireBaseUser {

  FirebaseUser user;


  /*final DatabaseReference _refEmpresas = FirebaseDatabase.instance.reference().child('empresas');
  final DatabaseReference _refEventos = FirebaseDatabase.instance.reference().child('eventos');
  final DatabaseReference _refComunicados = FirebaseDatabase.instance.reference().child('comunicados');
  final DatabaseReference _refPontosInter = FirebaseDatabase.instance.reference().child('pontosInteresse');

  DatabaseReference get refEmpresas => _refEmpresas;
  DatabaseReference get refPontosInter => _refPontosInter;
  DatabaseReference get refComunicados => _refComunicados;
  DatabaseReference get refEventos => _refEventos;*/


  /*Para mandar dados
  * _refEmpresas.push().set(Empresa.toMap());
  * */


 /* final List<Post> empresas = [];
  final List<Post> eventos = [];
  final List<Post> comunicados = [];
  final List<Post> pontosInteresse = [];*/

 /* bool loading = true;


  String imageUrl = "https://firebasestorage.googleapis.com/v0/b/urra-e2ced.appspot.com/o/favicon.png?alt=media&token=fb9e7070-0cd5-440c-bfa0-a09ddb068363";*/


 /* init() {
    //retorn o evento que e adicionado
    _refEventos.onChildAdded.listen((e) {
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

      eventos.insert(0, item);

    });

    _refEventos.onChildChanged.listen((e){
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
      print(index);

      eventos[index] = item;

      print(eventos.toString());
    });



    //retorn o comunicado que e adicionado
    _refComunicados.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.value;

      var item = new Comunicado(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
      );

      comunicados.insert(0, item);
    });




    //retorna o Ponto de Interesse que e adicionado
    _refPontosInter.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.value;

      var item = new PontoInteresse(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
          val["local"],
          val["horarioFun"]);

      pontosInteresse.insert(0, item);
    });



    _refEmpresas.onChildAdded.listen((e) {
      DataSnapshot data = e.snapshot;

      var val = data.value;

      var item = new Empresa(
          data.key,
          val["nome"],
          val["imagem"],
          val["descricao"],
          val["contato"],
          val["tipoEmpresa"],
          val["local"],
          val["horarioFun"]);

      empresas.insert(0, item);
    });



*/



   /* //Retorna o Utilizador que acabou de fazer login e Retorna null quando faz logout
    auth().onIdTokenChanged.listen((e){
      user = e;
    });
*/
   /*
  }


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
  }

*/



/*
  //Adiciona Evento a Database
  addEvento(Map map) async {
    await _refEventos.push(map);
  }
  //Remove Evento da Database
  removeEvento(String key) async {
    await _refEventos.child(key).remove();
  }
  //Altera Evento da Database
  alterarEvento(Evento empresa) async {
    _refEventos.child(empresa.key).update(empresa.toMap());
  }




  //Adiciona comunicado a Database
  addComunicado(Map map) async {
    await _refComunicados.push(map);
  }
  //Remove comunicado da Database
  removeComunicado(String key) async {
    await _refComunicados.child(key).remove();
  }
  //Altera comunicado da Database
  alterarComunicado(Comunicado empresa) async {
    _refComunicados.child(empresa.key).update(empresa.toMap());
  }




  //Adiciona pontosInteresse a Database
  addPontosInteresse(Map map) async {
    await _refPontosInter.push(map);
  }
  //Remove pontosInteresse da Database
  removePontosInteresse(String key) async {
    await _refPontosInter.child(key).remove();
  }
  //Altera pontosInteresse da Database
  alterarPontosInteresse(PontoInteresse pontoInter) async {
    _refPontosInter.child(pontoInter.key).update(pontoInter.toMap());
  }




  //Adiciona Empresa a Database
  addEmpresa(Map map) async {
    await _refEmpresas.push(map);
  }
  //Remove Empresa da Database
  removeEmpresa(String key) async {
    await _refEmpresas.child(key).remove();
  }
  //Altera Empresa da Database
  alterarEmpresa(Empresa empresa) async {
    _refEmpresas.child(empresa.key).update(empresa.toMap());
  }







  // Puts image into a storage.
  putImageEventos(File file) async {
    try {
      var task = _storageRefEventos.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }


  // Puts image into a storage.
  putImageComunicados(File file) async {
    try {
      var task = _storageRefComunicados.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }


  // Puts image into a storage.
  putImagePontosInteresse(File file) async {
    try {
      var task = _storageRefPontosInteresse.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }



  // Puts image into a storage.
  putImageEmpresas(File file) async {
    try {
      var task = _storageRefEmpresas.child(file.name).put(file);
      task.onStateChanged
          .listen((_) => loading = true, onDone: () => loading = false);

      var snapshot = await task.future;

      return snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Error in uploading to storage: $e");
    }
  }



  // Removes image from storage
  removeImage(String imageUrl) async {
    try {
      var imageRef = storage().refFromURL(imageUrl);
      await imageRef.delete();
    } catch (e) {
      print("Error in deleting $imageUrl: $e");
    }
  }


  signInEmail(String email, String password) async {

    try{
      await _auth.signInWithEmailAndPassword(email, password);
    }
    catch (e) {
      //todo usar o codigo para saber o que deu de errado
      //print(e.code);
      //print(e.message);
    }
  }



  signOut() async {
    await _auth.signOut();
  }*/
}
