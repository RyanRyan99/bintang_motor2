import 'package:flutter/material.dart';
import 'getdata-mp.dart';

class AlbumCellMp extends StatelessWidget {
  const AlbumCellMp(this.context, this.albumMp);
  @required
  final AlbumMp albumMp;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              height: 150, width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(albumMp.image),
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[new BoxShadow(blurRadius: 2, color: Colors.black38)]
              ),
            ),
          )
        ],
      ),
    );
  }
}
