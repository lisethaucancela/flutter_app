import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class descripcion_paquete  extends StatelessWidget  {
  late GoogleMapController mapController;

  double Latitud;
  double Longitud;
  String Nombre;

  descripcion_paquete({
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
    return   DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Información"),
              Tab(text: "Mapa"),
            ],
          ),
          title: Text(Nombre),
          backgroundColor: Color(0xff142855),
        ),
        body:  TabBarView(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children:  [
            const Image(image: AssetImage('images/paisaje.jpg'),height: 240, fit: BoxFit.cover, ),

            //const titleSection(),

            const Text('Horarios Atención', style: TextStyle( color: Colors.black87,fontSize: 20 )),
            Row(
              children:  const [
                Text('Lunes a Domingo  incluído feriados | 8:00 a 22:00', style: TextStyle(fontSize: 15, color: Colors.black45)),
              ],
            ),
            const Divider(color: Color(0xff373851)),
            const Text('Servicio de Transporte', style: TextStyle( color: Colors.black87,fontSize: 20 )),
            Row(
              children:  const [
                Text('Buseta | Transporte 4x4 | Costo de Tarifa mínima 1.25, ', style: TextStyle(fontSize: 15, color: Colors.black45)),
              ],
            ),
            const Divider(color: Color(0xff373851)),
            const Text('Atractivos Turísticos', style: TextStyle( color: Colors.black87,fontSize: 20 )),
            Text('Visita a talleres artísticos', style: TextStyle(fontSize: 15, color: Colors.black45)),
            Text('Observación de flora y fauna', style: TextStyle(fontSize: 15, color: Colors.black45)),
            Text('Camping', style: TextStyle(fontSize: 15, color: Colors.black45)),
            Text('Canyoning', style: TextStyle(fontSize: 15, color: Colors.black45)),
            const Divider(color: Color(0xff373851)),
            const Text('Actividad Turística', style: TextStyle( color: Colors.black87,fontSize: 20 )),
            Text('Alquiler y venta de equipo especializado', style: TextStyle(fontSize: 15, color: Colors.black45)),
            Text('Venta de artesanías y merchandising', style: TextStyle(fontSize: 15, color: Colors.black45)),

            const Divider(color: Color(0xff373851)),
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