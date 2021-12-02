import 'package:flutter/material.dart';


class PagQuilamo extends StatelessWidget {
   const PagQuilamo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold (
        /*appBar: AppBar(
          title: const Text('Mirador de Quilamo',
          style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          )),
          backgroundColor: const Color(0xff373851)
        ),*/

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:  [
          const Image(image: AssetImage('images/paisaje.jpg'),height: 240, fit: BoxFit.cover, ),

          const titleSection(),

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

    ),
    );
  }
}

class titleSection extends StatelessWidget {
  const titleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child:
           Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Mirador de Quilamo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
    );
  }
}