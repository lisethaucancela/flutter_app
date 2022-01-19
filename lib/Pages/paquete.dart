import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/Pages/paquetes.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Pages/mapa.dart';

class FutureBuilderTest extends StatefulWidget {

  @override

  ListaPaquetes createState() => ListaPaquetes();
}

class  ListaPaquetes extends State<FutureBuilderTest> {
  //FirebaseDatabase({FirebaseApp app, String databaseURL})
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final databaseReference  = FirebaseDatabase. instance .ref('Paquete');

  @override
  Widget build(BuildContext context) {
    getData();
    return MaterialApp(
      home: Scaffold (
      body:
      //ListView(
      // padding: const EdgeInsets.only(top:0),
      //  scrollDirection: Axis.vertical,
      // shrinkWrap: true,
            //crossAxisAlignment: CrossAxisAlignment. stretch ,
      //children: <Widget>[

              /*ButtonBar(
                children:[
                  TextButton(
                    child: const Text( 'View Record' ),
                    onPressed: () {
                      //Object _objdatabase = getData();
                    },
                  ),

                ]
              ),*/

        FutureBuilder(
          future:  FirebaseDatabase. instance .ref('Paquete').once(),
          builder: (BuildContext context,  AsyncSnapshot snapshot) {
            print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print(snapshot.data.snapshot.value.length);

                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
                List<dynamic> list = map.values.toList();

                return
                  ListView.builder(
                      padding:  const EdgeInsets.only(top:  0, left: 15, right: 15),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        //print( 'dfd ${list[index]}');
                        double latitud = double.parse(list[index]['latitud'].toString());
                        double longitud = double.parse(list[index]['longitud'].toString());
                        String nombre = list[index]['Nombre'].toString() ;

                        return
                          GestureDetector(
                            onTap:(){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  Mapa(Latitud:latitud,
                                                                          Longitud: longitud,
                                                                          Nombre:nombre))
                           );
                          },
                          child:
                          Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(list[index]['url']),
                                      Text('${list[index]['Nombre']}',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                      const SizedBox(height: 10,),
                                      Text(list[index]['Descripcion']),
                                    ],
                                  ),
                                ),
                              )
                          )
                          );
                      });
              }
              else {
                return Text('Result' );
              }
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
          //],
         // ),
            ),

          );

  }

  void  getData() async{

    Stream<DatabaseEvent> stream = databaseReference.onValue;
    print(stream);
// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
     // print('Snapshot: ${event.snapshot.value}');
  });

    DatabaseEvent event = await databaseReference.once();

 //Print the data of the snapshot
  //print('event: ${event.snapshot.value}');

  }

  List<Widget> _getDatas(AsyncSnapshot snapshot) {

    List<Widget> dataList = [];
    final mapList= Map<dynamic, dynamic>.from(snapshot.data.snapshot.value);
    mapList.forEach((key, value) {
      final nextHotel = Map<dynamic, dynamic>.from(value);
      print(nextHotel['Nombre']) ;
      dataList.add(Text(nextHotel["Nombre"]));
    });

    return dataList;
  }
}

class Paquete {
  final String Nombre;
  final String Descripcion;
  final String Titulo;

  Paquete(this.Nombre, this.Descripcion, this.Titulo);
}

class dataPackage extends StatelessWidget {
  dataPackage(Object objdatabase);

  get objdatabase => null;

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> fridgesDs = objdatabase as Map;
    fridgesDs.forEach((key, value) {
      print('V $value');
      print(value["Nombre"]);
      paquetes(value["Nombre"]);
      Text(value["Nombre"]);
    });
    return Text("Nombre");
  }

}