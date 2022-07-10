import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class escribenos extends StatelessWidget {
  escribenos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(children: <Widget>[
      Container(
        width: size.width * 1,
        height: size.height * 0.15,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Wekain_logo.png'), fit: BoxFit.contain),
        ),
      ),
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyForm(),

            ]),
      ),
    ]);
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final databaseReference = FirebaseDatabase.instance.ref('Mensaje');

  final _user = User(nombre: "",apellido:"",correo: "",ciudad: "",pais: "");
  late final Function onSaved;

  final fieldNombre = TextEditingController();
  final fieldApellido= TextEditingController();
  final fieldCorreo = TextEditingController();
  final fieldCiudad = TextEditingController();
  final fieldPais = TextEditingController();

  void clearText() {
    fieldNombre.clear();
    fieldApellido.clear();
    fieldCorreo.clear();
    fieldCiudad.clear();
    fieldPais.clear();
  }

  @override
  Widget build(BuildContext context) {

    // Crea un widget Form usando el _formKey que creamos anteriormente
    return Form(
      key: _formKey,

      child:
      Padding(
        padding: EdgeInsets.all(20.0) ,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

          TextFormField(
            decoration: InputDecoration(labelText: 'Nombre'),
            controller: fieldNombre,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un nombre';
              }
            },
            onSaved: (value) {
              _user.nombre = value as String;
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'Apellido'),
            controller: fieldApellido,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un apellido';
              }
            },
            onSaved: (value) {
              _user.apellido = value as String;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Correo Electrónico'),
            controller: fieldCorreo,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (value) {
              //Validator
            },
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                return 'Ingrese un correo electrónico válido';
              }
              return null;
            },
            onSaved: (value) {
              _user.correo = value as String;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Ciudad'),
            controller: fieldCiudad,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese la ciudad';
              }
            },
            onSaved: (value) {
              _user.ciudad = value as String;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'País'),
            controller: fieldPais,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingrese un país';
              }
            },
            onSaved: (value) {
              _user.pais = value as String;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 5.0, horizontal: MediaQuery.of(context).size.width*0.31),

            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Información Guardada')));

                  _formKey.currentState!.save();

                  databaseReference.push().set({
                    'Name': _user.nombre,
                    'Apellido':_user.apellido,
                    'Mail': _user.correo,
                    'Ciudad': _user.ciudad,
                    'Pais': _user.pais,
                  });
                  clearText();
                }

              },
              child: Text('Guardar'),
            ),
          ),
        ],
      ),
      )
    );
  }
}

class User {
  String nombre;
  String apellido;
  String correo;
  String ciudad;
  String pais;

  User({ required this.nombre, required this.apellido, required this.correo, required this.ciudad, required this.pais });
}