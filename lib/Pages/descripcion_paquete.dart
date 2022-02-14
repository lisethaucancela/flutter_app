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

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double infoHeight = 340.0;
    final double tempHeight = MediaQuery .of(context) .size .height -
        (MediaQuery .of(context)  .size .width) +  24.0;
    var size = MediaQuery .of(context) .size;
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
       /* appBar: AppBar(
          title: Text(
            Lista['Nombre'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          backgroundColor: Color(0xff142855),
        ),*/
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[


              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      ListView(
                        children: [
                          getBody(size),

                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Color(0xffE9EBF0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: const Offset(1.1, 1.1),
                                    blurRadius: 10.0),
                              ],
                            ),
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                  constraints: BoxConstraints(
                                      minHeight: infoHeight,
                                      maxHeight: tempHeight > infoHeight
                                          ? tempHeight
                                          : infoHeight),
                                  // crossAxisAlignment:   CrossAxisAlignment.start,
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 0.0,
                                              left: 18,
                                              right: 16,
                                              bottom: 16),
                                          child: Text(
                                            Lista['Nombre'].toString(),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              letterSpacing: 0.27,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Spacer(),
                                            getTimeBoxUI(
                                                Lista['temperatura'].toString(),
                                                'temperatura',
                                                Icon(Icons.cloud)),
                                            Spacer(),
                                            getTimeBoxUI(
                                                Lista['distancia'].toString(),
                                                'Time',
                                                Icon(Icons.timelapse_rounded)),
                                            Spacer(),

                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 18,
                                              bottom: 8),
                                          child: Text(
                                              Lista['Descripcion'].toString(),
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff142855))),
                                        ),
                                        const Divider(color: Color(0xff373851)),
                                        const Text('Servicio de Transporte',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20)),
                                        const Text(
                                            'Buseta | Transporte 4x4 | Costo de Tarifa mínima 1.25, ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black45)),
                                        const Divider(color: Color(0xff373851)),
                                      ])),
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
              ),
              getGNav()
            ],
          ),
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 125,
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 9.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    icon.icon,
                    size: 26,
                    color: Color(0xff005CE6),
                  ),
                  Spacer(),
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 0.27,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getGNav() {
    return GNav(
      rippleColor: Colors.purple,
      hoverColor: Colors.grey,
      haptic: true,
      tabBorderRadius: 15,
      //tabActiveBorder: Border.all(color: Colors.purple, width: 0), // tab button border
      //tabBorder: Border.all(color: Colors.grey, width: 0), // tab button border
      // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
      curve: Curves.easeOutExpo,
      duration: Duration(milliseconds: 900),
      gap: 8,
      color: Colors.grey[900],
      activeColor: Colors.purple,
      iconSize: 28,
      tabBackgroundColor: Colors.purple.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      textStyle: TextStyle(
        color: Colors.purple,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      mainAxisAlignment: MainAxisAlignment.center,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Información',
        ),
        GButton(
          icon: Icons.h_plus_mobiledata,
          text: 'Mapa',
        ),

      ],

    ) ;
  }

  Widget getBody(size) {

    return SingleChildScrollView(
      child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage( image: NetworkImage(Lista['url']),
                    fit: BoxFit.cover),
              ),
            ),
          ]
      ),
    );
  }
}
