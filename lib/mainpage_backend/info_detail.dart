import 'package:bintang_motor/mainpage_backend/getdata-mp.dart';
import 'package:flutter/material.dart';

class InfoPromoDetail extends StatefulWidget {
  final AlbumMp curAlbum;
  InfoPromoDetail({@required this.curAlbum});
  @override
  _InfoPromoDetailState createState() => _InfoPromoDetailState();
}

class _InfoPromoDetailState extends State<InfoPromoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.curAlbum.image),
              )
            ),
          )
        ],
      ),
    );
  }
}
