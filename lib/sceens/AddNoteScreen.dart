import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/Models/Note.dart';
import 'package:notes/controllers/NoteController.dart';
import 'package:notes/utils/Colors.dart';
import 'package:notes/widgets/Input.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final NoteController noteController = Get.put(NoteController());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  add(){
    Note note = Note(
      id: noteController.notes.length,
      title: titleController.text,
      description: descriptionController.text
    );
    note.add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pink,
      ),
      body: ListView(
        children: [
          Input(
              labelText: "Title",
              icon: Icon(Icons.title, color: pink),
              textEditingController: titleController
          ),
          Input(
              labelText: "Description",
              icon: Icon(Icons.notes, color: pink),
              textEditingController: descriptionController
          ),
          SizedBox(height: 20.0,),
          TextButton(
            onPressed: (){
              add();
            },
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 14
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0)),
              foregroundColor: MaterialStateProperty.all<Color>(white),
              backgroundColor: MaterialStateProperty.all<Color>(pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: pink)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
