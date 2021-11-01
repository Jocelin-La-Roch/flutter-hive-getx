import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Models/Note.dart';
import 'package:notes/sceens/ViewNoteScreen.dart';


class NoteView extends StatefulWidget {
  final Note note;
  const NoteView({Key? key, required this.note}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.note.title),
      subtitle: Text(widget.note.title),
      onTap: (){
        Get.to(() => ViewNoteScreen(note: widget.note));
      },
    );
  }
}


