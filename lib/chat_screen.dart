import 'package:flutter/material.dart';
import 'package:chat_flutter/chat_massage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<ChatMassage> _messages = <ChatMassage>[];
  void _handleSubmited(String str_message) {
    ChatMassage chatMassage = ChatMassage.withText(
      message: str_message,
    );
    setState(() {
      _messages.insert(0, chatMassage);
    });

    _textEditingController.clear();
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: IconThemeData(color: Colors.blue),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textEditingController,
                  onSubmitted: _handleSubmited,
                  decoration: InputDecoration.collapsed(
                    hintText: "Send Message...",
                  ),
                ),
              ),
              Container(
                child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () =>
                        _handleSubmited(_textEditingController.text)),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 3.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
