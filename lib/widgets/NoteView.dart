import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Models/Note.dart';
import 'package:notes/sceens/EditNoteScreen.dart';
import 'package:notes/sceens/ViewNoteScreen.dart';
import 'package:notes/utils/Colors.dart';


class NoteView extends StatefulWidget {
  final Note note;
  const NoteView({Key? key, required this.note}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  delete(){
      Get.defaultDialog(
        title: "Delete this Note ?",
        middleText: "",
        textConfirm: "Delete",
        textCancel: "Cancel",
        cancelTextColor: pink,
        confirmTextColor: black,
        onConfirm: (){
          widget.note.delete();
          Get.back();
        },
      );
  }

  edit(){
    Get.to(() => EditNoteScreen(note: widget.note));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.note.title, overflow: TextOverflow.ellipsis,),
      subtitle: Text(widget.note.description, overflow: TextOverflow.ellipsis,),
      onTap: (){
        Get.to(() => ViewNoteScreen(note: widget.note));
      },
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: edit, icon: Icon(Icons.edit)),
            IconButton(onPressed: delete, icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}


