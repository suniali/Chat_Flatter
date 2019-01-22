import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}
class ChatScreenState extends State<ChatScreen>
{
  final TextEditingController _textEditingController =TextEditingController();

  void _handleSubmited(String str_message)
  {
      _textEditingController.clear();
  }
  Widget _textComposerWidget(){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child:Row(children: <Widget>[
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
            onPressed: ()=>_handleSubmited(_textEditingController.text)
          ),
        )
      ],)
    );
  }
  @override
  Widget build(BuildContext context) {
    return _textComposerWidget();
  }

}