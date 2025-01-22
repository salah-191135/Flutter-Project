import 'dart:html';
import 'package:flutter_application_4/TaskItem.dart';
import 'TaskItem.dart';
import 'CompletedTask.dart';
import 'Task.dart';
import 'MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

List<Task> InboxTasks = [];
List<Task> CompletedTasks = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {'/': (context) => MainPage()},
    );
  }
}

class MainPage extends StatelessWidget {
  final panelController = PanelController();
  TextEditingController TaskTitleController = TextEditingController();

  DateTime? mu = DateTime(2022);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 200, 229, 255),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Inbox",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )),
        body: SlidingUpPanel(
          defaultPanelState: PanelState.CLOSED,
          controller: panelController,
          minHeight: 0,
          body: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 200, 229, 255),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: InboxTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TaskItem(
                              taskTitle: InboxTasks[index].taskTitle,
                              duoTo: InboxTasks[index].duoTo,
                              tContent: InboxTasks[index].tContent,
                              index: index,
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      height: 250,
                      child: ListView.builder(
                          padding: EdgeInsets.all(8),
                          itemCount: CompletedTasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CompletedTask(
                              title: CompletedTasks[index].taskTitle,
                              tContent: CompletedTasks[index].tContent,
                              duoTo: CompletedTasks[index].duoTo,
                              index: index,
                            );
                          }),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          panelController.open();
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          panel: Container(
            height: 35,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextField(
                      controller: TaskTitleController,
                      decoration: InputDecoration()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.calendar_month_rounded),
                            color: Color.fromARGB(120, 77, 77, 77),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.flag_sharp,
                                color: Color.fromARGB(120, 77, 77, 77),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.local_offer_rounded,
                                color: Color.fromARGB(120, 77, 77, 77),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.inbox_rounded,
                                color: Color.fromARGB(120, 77, 77, 77),
                              )),
                          Text(
                            "Inbox ",
                            style: TextStyle(
                                color: Color.fromARGB(120, 77, 77, 77)),
                          )
                        ]),
                    IconButton(
                      onPressed: () {
                        InboxTasks.add(
                            Task("$TaskTitleController", "Tcontent", mu!));
                      },
                      icon: Icon(Icons.send, color: Colors.blue),
                      iconSize: 30,
                      color: Colors.blue,
                      padding: EdgeInsets.all(3),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        drawer: Drawer(
          width: 350,
          child: MyDrawer(),
        ));
  }
}
