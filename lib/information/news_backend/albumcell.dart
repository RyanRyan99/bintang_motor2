import 'package:flutter/material.dart';
import 'album.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.context, this.album);
  @required
  final Album album;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:
        EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.network(
                  album.images,
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}