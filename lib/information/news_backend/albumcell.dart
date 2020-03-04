import 'package:flutter/material.dart';
import 'album.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.context, this.album);
  @required
  final Album album;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage(album.images),
                 ),
                 borderRadius: BorderRadius.circular(10.0),
                 boxShadow: <BoxShadow>[
                   new BoxShadow(blurRadius: 2,spreadRadius: 1.0, color: Colors.black45)
                 ]
               ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}