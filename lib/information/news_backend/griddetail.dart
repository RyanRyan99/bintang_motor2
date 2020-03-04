import 'package:flutter/material.dart';
import 'album.dart';

class GridDetails extends StatefulWidget {
  final Album curAlbum;
  GridDetails({@required this.curAlbum});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                    placeholder: "assets/logo.png",
                    image: widget.curAlbum.images,
                  ),
                  Text(widget.curAlbum.title),
                  Divider(),
                  Text(widget.curAlbum.content)
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            OutlineButton(
              child: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}