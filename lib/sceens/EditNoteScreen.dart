import 'package:flutter/material.dart';
import 'package:notes/Models/Note.dart';
import 'package:notes/utils/Colors.dart';
import 'package:notes/widgets/Input.dart';

class EditNoteScreen extends StatefulWidget {

  final Note note;

  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  _EditNoteScreenState createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note.title;
    descriptionController.text = widget.note.description;
    super.initState();
  }

  edit(){
    widget.note.edit(titleController.text, descriptionController.text);
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
          TextButton(
            onPressed: (){
              edit();
            },
            child: Text(
              "Edit",
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
