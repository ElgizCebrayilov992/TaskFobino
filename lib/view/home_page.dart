import 'package:flutter/material.dart';
import 'package:fonibotask/models/note.dart';
import 'package:fonibotask/services/json_service.dart';
import 'package:fonibotask/wdigets/list_wdiget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int val = 4;
  Future<List<Note>> noteList;

  @override
  void initState() {
    noteList = JsonService().getJsonPlaceHolderData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWith = MediaQuery.of(context).size.width;
    double mediaWithDouble = double.infinity;
    double mediaHeight = MediaQuery.of(context).size.height;
    debugPrint("mediaWith: $mediaWith");
    debugPrint("mediaWithDouble: $mediaWithDouble");
    debugPrint("mediaHeight: $mediaHeight");

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      appBar: AppBar(
        iconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.blue),
        textTheme:
            Theme.of(context).primaryTextTheme.apply(bodyColor: Colors.blue),
//        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(".task"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, top: 10),
            child: Text(
              "Tasks ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

//          Row(
//            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              //color
//              Container(
//                width: 10,
//                height: 70,
//                decoration: BoxDecoration(
//                    color: ColorGenerator().randomCcolors(),
//                    borderRadius: BorderRadius.circular(10)),
//              ),
//
//              Container(
//                alignment: Alignment.centerLeft,
//                margin: EdgeInsets.only(left: 5, right: 5),
//                padding: EdgeInsets.only(left: 5, right: 5),
//                height: 70,
//                width: MediaQuery.of(context).size.width - 36,
//                decoration: BoxDecoration(
//                  color: Colors.grey.withOpacity(0.2),
//                  borderRadius: BorderRadius.circular(10),
//                ),
//                child: ListTile(
//                  title: Text("sdsdfdsfd"),
//                  subtitle: Text("Created at: ${"DSFdsfdsf"}"),
//                  trailing: Radio(
//                    value: 1,
//                    groupValue: val,
//                    onChanged: (value) {
//                      setState(() {
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                        val = value;
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                      });
//                    },
//                  ),
//                ),
//              ),
//            ],
//          ),
//          Row(
//            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              //color
//              Container(
//                width: 10,
//                height: 70,
//                decoration: BoxDecoration(
//                    color: ColorGenerator().randomCcolors(),
//                    borderRadius: BorderRadius.circular(10)),
//              ),
//
//              Container(
//                alignment: Alignment.centerLeft,
//                margin: EdgeInsets.only(left: 5, right: 5),
//                padding: EdgeInsets.only(left: 5, right: 5),
//                height: 70,
//                width: MediaQuery.of(context).size.width - 36,
//                decoration: BoxDecoration(
//                  color: Colors.grey.withOpacity(0.2),
//                  borderRadius: BorderRadius.circular(10),
//                ),
//                child: ListTile(
//                  title: Text("sdsdfdsfd"),
//                  subtitle: Text("Created at: ${"DSFdsfdsf"}"),
//                  trailing: Radio(
//                    value: 2,
//                    groupValue: val,
//                    onChanged: (value) {
//                      setState(() {
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                        val = value;
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                      });
//                    },
//                  ),
//                ),
//              ),
//            ],
//          ),
//          Row(
//            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: [
//              //color
//              Container(
//                width: 10,
//                height: 70,
//                decoration: BoxDecoration(
//                    color: ColorGenerator().randomCcolors(),
//                    borderRadius: BorderRadius.circular(10)),
//              ),
//
//              Container(
//                alignment: Alignment.centerLeft,
//                margin: EdgeInsets.only(left: 5, right: 5),
//                padding: EdgeInsets.only(left: 5, right: 5),
//                height: 70,
//                width: MediaQuery.of(context).size.width - 36,
//                decoration: BoxDecoration(
//                  color: Colors.grey.withOpacity(0.2),
//                  borderRadius: BorderRadius.circular(10),
//                ),
//                child: ListTile(
//                  title: Text("sdsdfdsfd"),
//                  subtitle: Text("Created at: ${"DSFdsfdsf"}"),
//                  trailing: Radio(
//                    value: 3,
//                    groupValue: val,
//                    onChanged: (value) {
//                      setState(() {
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                        val = value;
//                        debugPrint("groupValue: $val" + "   NoteID: $value");
//                      });
//                    },
//                  ),
//                ),
//              ),
//            ],
//          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _placeHolderDatasWigdet,
          )
        ],
      ),
    );
  }

  Widget get _placeHolderDatasWigdet => FutureBuilder<List<Note>>(
        future: noteList,
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data
                  .map(
                    (e) => ListWdiget(e, 1),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
}
/*
* Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //color
                          Container(
                            width: 10,
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                color: e.color,
                                borderRadius: BorderRadius.circular(10)),
                          ),

                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.90,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(e.title),
                              subtitle: Text("Created at: ${e.createdAt}"),
                              trailing: Radio(
                                value: e.id,
                                groupValue: val,
                                onChanged: (value) {
                                  setState(() {
                                    debugPrint("groupValue: $val" +
                                        "   NoteID: $value");
                                    val = value;
                                    debugPrint("groupValue: $val" +
                                        "   NoteID: $value");
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
* 
* */
