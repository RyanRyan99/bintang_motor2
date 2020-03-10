import 'package:flutter/material.dart';
import 'getdata-prod.dart';

class AlbumCellPrManual extends StatelessWidget {
  const AlbumCellPrManual(this.context, this.albumProd);
  final AlbumProdManual albumProd;
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
class AlbumCellPrMatic extends StatelessWidget {
  const AlbumCellPrMatic(this.context, this.albumProd);
  final AlbumProdMatic albumProd;
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

class AlbumCellPrCub extends StatelessWidget {
  const AlbumCellPrCub(this.context, this.albumProdCub);
  final AlbumProdCub albumProdCub;
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
                    image: NetworkImage(albumProdCub.image),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

