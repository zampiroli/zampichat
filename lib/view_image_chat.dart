import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ViewImageChat extends StatelessWidget {
  final Map _msg;
  ViewImageChat(this._msg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem'),
        backgroundColor: Color(0XFF3D0B2A),
        elevation: 0,
      ),
      backgroundColor: Color(0XFF222222),
      body: Container(
        color: Color(0XFF222222),
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: Expanded(
              child: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(
                    backgroundColor: Colors.purple[50]),
                imageUrl: _msg['imgUrl'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
ViewImageChat
Scaffold(
      appBar: AppBar(
        title: Text('Imagem'),
        backgroundColor: Color(0XFF3D0B2A),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Expanded(
            child: CachedNetworkImage(
              placeholder: (context, url) =>
                  CircularProgressIndicator(backgroundColor: Colors.purple[50]),
              imageUrl: _msg['imgUrl'],
            ),
          ),
        ),
      ),
    );
*/
