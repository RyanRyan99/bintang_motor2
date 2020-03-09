import 'package:flutter/material.dart';
import 'getdata-prod.dart';

class AlbumCellPr extends StatelessWidget {
  const AlbumCellPr(this.context, this.albumProd);
  final AlbumProd albumProd;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(albumProd.image),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
