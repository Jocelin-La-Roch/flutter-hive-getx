import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/NoteController.dart';
import 'package:notes/hive/NoteBox.dart';
import 'package:notes/sceens/AddNoteScreen.dart';
import 'package:notes/utils/Colors.dart';
import 'package:notes/widgets/NoteView.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {

  getNotes() async {
    final NoteController noteControllerP = Get.put(NoteController());
    await noteControllerP.setNotes(NoteBox().getNotes());
  }

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: GetBuilder(
        builder: (NoteController noteController){
          return noteController.notes.length == 0 ? Center(
            child: Text("No data found !"),
          ): ListView.builder(
              itemCount: noteController.notes.length,
              itemBuilder: (context, index){
                return NoteView(note: noteController.notes[index]);
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNoteScreen());
        },
        child: Icon(Icons.add, color: white),
        backgroundColor: pink,
      ),
    );
  }
}
