import 'package:flutter/material.dart';
import 'package:flutterdemo1/ChatMessage.dart';

class ChatScreen extends StatefulWidget {

  @override
  State createState() {
    return new ChatScreenState();
  }

}


class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textEditingController = new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage> [];

  Widget _textComposerWidget(BuildContext context) {
    return IconTheme(
      data: new IconThemeData(
        color: Theme.of(context).accentColor
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: "Jot something down"),
                    controller: _textEditingController,
                    onSubmitted: _handleSubmitted
                )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textEditingController.text)
              )
            )
          ],
        )
      ),
    );
  }

  void _handleSubmitted(String text) {
    if(text == null || text.isEmpty) {
      return;
    }
    _textEditingController.clear();
    ChatMessage chatMessage =  new ChatMessage(
        text: text
    );
    setState(() {
      _messages.insert(0, chatMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int idx) => _messages[idx],
                itemCount: _messages.length
            )
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(context),
        )
      ],
    );
  }

}