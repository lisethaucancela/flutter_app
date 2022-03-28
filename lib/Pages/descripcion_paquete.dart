import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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

  get color1 => null;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double infoHeight = 340.0;
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width) +
        24.0;
    var size = MediaQuery.of(context).size;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Lista['Nombre'],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        backgroundColor: Color(0xff142855),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 55),
            child: const TabBar(
                indicatorWeight: 3,
                indicatorColor: Color(0xff142855),
                labelColor: Color(0xff142855),
                unselectedLabelColor: Color(0xff686D75),
                tabs: [
                  Tab(text: "Itinerario", icon: Icon(Icons.timelapse)),
                  Tab(
                      text: "Precio",
                      icon: Icon(Icons.monetization_on_outlined)),
                  Tab(text: "Mapa", icon: Icon(Icons.location_on_outlined)),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: (getItinerario(size)),
                  ),
                  ListView(
                    children: [
                      getPrecio(size),
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
          ),
        ]),
      ),
    );
  }


  Widget getPrecio(size) {
    return SingleChildScrollView(
      child: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height * 0.80,
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    //AssetImage('images/paisaje.jpg'),
                    NetworkImage(
                  Lista['foto2'],
                ),
                fit: BoxFit.fill),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //
              Container(
                width: double.infinity,
                height: size.height,
                decoration: BoxDecoration(
                  color: Color(0xffd0d0d0).withOpacity(0.7),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 250,
                        //height: 60,
                        margin: EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        // padding: EdgeInsets.only(top: 6, left: 5, right: 5, bottom: 6),

                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("\$",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 99,
                                      color: Color(int.parse(Lista['color1'])),
                                      fontWeight: FontWeight.bold,
                                    )),
                                Column(children: <Widget>[
                                  Text(Lista['Precio'].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color:
                                              Color(int.parse(Lista['color1'])),
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'POR PERSONA',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Color(int.parse(Lista['color1'])),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -2,
                                    ),
                                  ),
                                ]),
                              ]),
                          Divider(
                            color: Color(int.parse(Lista['color1'])),
                            thickness: 2,
                          ),
                          Text(Lista['minimo'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(int.parse(Lista['color1'])),
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -1)),
                        ]),
                      ),
                      SizedBox(height: size.height * 0.1),
                      getCardPrecio('Incluye', 'incluye'),
                      getCardPrecio('No Incluye', 'no incluye'),
                      getCardPrecio('Que llevar', 'llevar')
                    ]),
              ),
            ],
          ),
        ),
      ]),
    );
  }


  Widget getItinerario(size) {
    return SingleChildScrollView(
      child: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          //height: size.height * 0.81,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  Lista['foto1'],
                ),
                fit: BoxFit.fill),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              //
              Container(
                width: double.infinity,
                height: size.height,
                decoration: BoxDecoration(
                  color: Color(0xff777777).withOpacity(0.4),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        // width: 250,
                        //height: 60,
                        margin: EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        // padding: EdgeInsets.only(top: 6, left: 5, right: 5, bottom: 6),

                        child: Column(children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("ITINERARIO",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1)),
                              ]),
                          Text(Lista['Nombre'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0)),
                        ]),
                      ),
                      SizedBox(height: size.height * 0.02),
                      getTimeBoxUI(Lista['temperatura'].toString(),
                          'temperatura', Icon(Icons.cloud), size),
                      getCardDescripcion(size),
                      getCardItinerario(size)
                    ]),
              ),
            ],
          ),
        ),
      ]),
    );
  }
  Widget getCardDescripcion(size) {
    var pad_width = size.width * 0.03;
    return Container(
      margin: EdgeInsets.only(
          top: 20, left: pad_width, right: pad_width, bottom: 0),
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xff292929).withOpacity(0.5),
        shape: BoxShape.rectangle,
      ),
      //crossAxisAlignment: CrossAxisAlignment.start,

      child: Container(
          height: size.height * 0.3  + Lista['Descripcion'].toString().length/7 ,
          // crossAxisAlignment:   CrossAxisAlignment.start,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DESCRIPCIÓN',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 15, color: Colors.white)),
                Text('',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 6, color: Colors.white)),
                Text(Lista['Descripcion'].toString(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300)),
              ])),
    );
  }

  Widget getCardItinerario(size) {
    var pad_width = size.width * 0.03;

    return Container(
      height: size.height * 0.15 + Lista['Descripcion'].toString().length/12,
      margin: EdgeInsets.only(
          top: 20, left: pad_width, right: pad_width, bottom: 0),
      padding: EdgeInsets.only(
        left: 28,
        right: 28,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Color(0xff292929).withOpacity(0.5),
        shape: BoxShape.rectangle,
      ),

      // crossAxisAlignment:   CrossAxisAlignment.start,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Lista['itinerario'].toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300)),
          ]),
    );
  }

  Widget getCardPrecio(Titulo, Descripcion) {
    return Container(
      width: 250,
      height: 60,
      margin: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
      padding: EdgeInsets.only(top: 6, left: 5, right: 5, bottom: 6),
      decoration: BoxDecoration(
          color: Color(int.parse(Lista['color1'])).withOpacity(0.9),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: Column(children: <Widget>[
        Text(Titulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15,
                color: Color(0xffffffff),
                fontWeight: FontWeight.bold)),
        Text(Lista[Descripcion].toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Color(0xffffffff))),
      ]),
    );
  }


  Widget getTimeBoxUI(String text1, String txt2, Icon icon, size) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: Container(
        width: size.width * 0.45,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.thermostat,
              size: 24,
              color: Colors.black,
            ),
            //Spacer(flex: 1),
            Text(
              Lista['temperatura'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 0.1,
                color: Colors.black,
              ),
            ),
            VerticalDivider(color: Colors.black, thickness: 1),
            Icon(
              Icons.landscape_outlined,
              size: 24,
              color: Colors.black,
            ),
            Text(
              Lista['mts'].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.1,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
