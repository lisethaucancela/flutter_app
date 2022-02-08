import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Color myColorGrey = Color(0xfff2f5f8),
    myColorBlue = Color(0xff3b73de),
    lightText = Color(0xff8891a4);

class descripcion_paquete extends StatelessWidget {
  late GoogleMapController mapController;

  dynamic Lista;

  descripcion_paquete({
    Key? key,
    required this.Lista,
  }) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    double latitud = double.parse(Lista['latitud'].toString());
    double longitud = double.parse(Lista['longitud'].toString());
    final CameraPosition _initialPosition =
        CameraPosition(target: LatLng(latitud, longitud), zoom: 13);
    final Set<Marker> _markers = Set();
    _markers.add(
      Marker(
        markerId: MarkerId(Lista['Nombre']),
        position: LatLng(latitud, longitud),
      ),
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            indicatorWeight: 3,
            indicatorColor: Color(0xff80B5FF),
            tabs: [
              Tab(text: "Información"),
              Tab(text: "Mapa"),
            ],
          ),
          title: Text(Lista['Nombre'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              )),
          backgroundColor: Color(0xff142855),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ClipRRect(
                  //borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    Lista['url'],
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                    children: [
                      Container(
                        width: 110,
                        height: 60,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 9.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),

                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: [
                                Icon(
                                  Icons.wb_cloudy,
                                  size: 26,
                                  color: Color(0xff005CE6),
                                ),
                                Spacer(),
                                Text(
                                  Lista['temperatura'].toString(),
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                            ]),
                      ),
                      Container(
                        width: 110,
                        height: 60,
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 9.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: [
                                const Icon(
                                  Icons.directions_car,
                                  size: 26,
                                  color: Color(0xff005CE6),
                                ),
                                Spacer(),
                                Text(
                                  Lista['distancia'].toString(),
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ]),
                            ]),
                      ),
                    ]),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color(0xffE9EBF0),
                  ),
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  child: Column(
                    children: [
                      //Image.network(Lista['url'],height: 240, fit: BoxFit.cover, ),

                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Lista['Descripcion'].toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff142855))),

                                const Divider(color: Color(0xff373851)),
                                const Text('Servicio de Transporte',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20)),

                                Text(
                                    'Buseta | Transporte 4x4 | Costo de Tarifa mínima 1.25, ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black45)),

                                const Divider(color: Color(0xff373851)),
                                const Text('Atractivos Turísticos',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20)),
                                Text('Visita a talleres artísticos',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black45)),
                                //Text('Observación de flora y fauna', style: TextStyle(fontSize: 15, color: Colors.black45)),
                                //Text('Camping', style: TextStyle(fontSize: 15, color: Colors.black45)),
                                //Text('Canyoning', style: TextStyle(fontSize: 15, color: Colors.black45)),
                                const Divider(color: Color(0xff373851)),
                                const Text('Actividad Turística',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 20)),
                                Text('Alquiler y venta de equipo especializado',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black45)),
                                Text('Venta de artesanías y merchandising',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black45)),
                                const Divider(color: Color(0xff373851)),
                              ])),
                    ],
                  ),
                ),
              ],
            ),
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              markers: _markers,
            ),
          ],
        ),
      ),
    );
  }
}
