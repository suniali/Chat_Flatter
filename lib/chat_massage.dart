import 'package:flutter/material.dart';

const String _name="Ali";

class ChatMassage extends StatelessWidget
{
  final String message;

  ChatMassage.withText({this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name,style: Theme.of(context).textTheme.subhead,),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(message),
              )
            ],
          )
      ],)
    );
  }

}