import 'package:flutter/material.dart';
import 'package:notes/Models/Note.dart';
import 'package:notes/utils/Colors.dart';

class ViewNoteScreen extends StatefulWidget {
  final Note note;
  const ViewNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  _ViewNoteScreenState createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Text(widget.note.title),
          SizedBox(height: 15.0),
          Divider(),
          SizedBox(height: 15.0),
          Text(widget.note.description)
        ],
      ),
    );
  }
}
