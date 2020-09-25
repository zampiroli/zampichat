import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zampichat/view_image_chat.dart';
import 'package:dynamic_url_image_cache/dynamic_url_image_cache.dart';

class ChatMessage extends StatelessWidget {
  //const ChatMessage({Key key}) : super(key: key);
  ChatMessage(this.data, this.mine);
  final Map<String, dynamic> data;
  final bool mine;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Row(
        children: <Widget>[
          !mine
              ? Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                    onTap: () {
                      print("Clicou avatar outroo - " + data['uid']);
                    },
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  !mine ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                data['imgUrl'] != null
                    //Reconhece o clique na imagem dentro do chat;
                    ? GestureDetector(
                        child: Image(
                          image: DynamicUrlImageCache(
                            imageId: data['imgUrl'],
                            imageUrl: data['imgUrl'],
                          ),
                        ),

                        /*CachedNetworkImage(
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                                  backgroundColor: Colors.purple[50]),
                          imageUrl: data['imgUrl'],
                          width: 250,
                        ),*/
                        onTap: () {
                          print("teste click");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewImageChat(data),
                            ),
                          );
                        },
                        onLongPress: () {
                          print("teste longoooo");
                        },
                      )
                    : Text(
                        data['text'],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: mine ? TextAlign.end : TextAlign.start,
                      ),
                Text(
                  data['senderName'],
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          mine
              ? Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data['senderPhotoUrl']),
                    ),
                    onTap: () {
                      print("clicou meu avatar - " + data['uid']);
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
