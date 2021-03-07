import 'package:flutter/material.dart';
import 'package:fonibotask/color/color_generator.dart';
import 'package:fonibotask/models/note.dart';

class ListWdiget extends StatefulWidget {
  Note note;
  int value;

  ListWdiget(Note note, int value) {
    this.note = note;
    this.value = value;
  }

  @override
  _ListWdigetState createState() => _ListWdigetState();
}

class _ListWdigetState extends State<ListWdiget> {
  int val = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //color
          Container(
            width: 10,
            height: 70,
            decoration: BoxDecoration(
                color: ColorGenerator().randomCcolors(),
                borderRadius: BorderRadius.circular(10)),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 5, right: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 70,
            width: MediaQuery.of(context).size.width - 36,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(widget.note.title),
              subtitle: Text("Created at: ${widget.note.createdAt}"),
              trailing: Radio(
                value: 1,
                groupValue: widget.value,
                onChanged: (value) {
                  setState(() {
                    debugPrint("groupValue: $val" + "   NoteID: $value");
                    widget.value = value;
                    debugPrint("groupValue: $val" + "   NoteID: $value");
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
