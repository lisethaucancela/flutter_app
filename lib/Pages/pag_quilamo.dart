import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PagQuilamo extends StatelessWidget {
    PagQuilamo({Key? key}) : super(key: key);

   final imageList = [
     'images/paisaje.jpg',
     'images/img_05.png',
     'images/Wekain_logo.png',
     'images/Packing.jpg'
   ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold (
        appBar: AppBar(
          title: const Text('Galería de Fotos',
          style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          )),
          backgroundColor: const Color(0xff373851)
        ),

      body: Container(
        child: PhotoViewGallery.builder(
          itemCount: imageList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(
                imageList[index],
              ),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(),
          enableRotation: true,
        ),
      ),

    ) ;
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