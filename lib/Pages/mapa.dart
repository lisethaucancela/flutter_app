import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatelessWidget  {

  late GoogleMapController mapController;

    double Latitud;
    double Longitud;
    String Nombre;

  Mapa({
    Key? key,
     required this.Latitud,
    required this.Longitud,
    required this.Nombre,
  }) : super(key: key);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    print(Latitud);
    print(Longitud);
    final CameraPosition _initialPosition =  CameraPosition(
        target: LatLng(Latitud,Longitud),
        zoom: 13
    );
    final Set<Marker> _markers = Set();
    _markers.add(
      Marker(
        markerId: MarkerId(Nombre),
        position: LatLng(Latitud, Longitud),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(Nombre),
          centerTitle: true,
        ),
        body: Stack(

          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              markers: _markers,

            ),

          ],
        ));
  }
}
