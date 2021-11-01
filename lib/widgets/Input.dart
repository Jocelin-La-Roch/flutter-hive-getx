import 'package:flutter/material.dart';
import 'package:notes/utils/Colors.dart';

class Input extends StatefulWidget {

  final String labelText;
  final Icon icon;
  final TextEditingController textEditingController;

  const Input({Key? key, required this.labelText, required this.icon, required this.textEditingController}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextFormField(
        cursorColor: pink,
        controller: widget.textEditingController,
        keyboardType:  TextInputType.emailAddress,
        style: TextStyle(
          color: black,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: black,
          ),
          icon: widget.icon,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: pink,
            ),
          ),
        ),
      ),
    );
  }
}
