import 'package:flutter/material.dart';
import 'package:practice_app/utils/list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controler = TextEditingController();

  List todoList = [
    ['Created by: Redjan Phil S. Visitacion', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controler.text, false]);
      _controler.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 255, 69, 109),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Redjan\'s Simple Task List',
          ),
        ),
        backgroundColor: const Color.fromRGBO(212, 39, 68, 1.0),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _controler,
                  style: const TextStyle(
                    color: Color.fromRGBO(212, 39, 68, 1.0),
                  ),
                  cursorColor: Color.fromRGBO(212, 39, 68, 1.0),
                  decoration: InputDecoration(
                    focusColor: Color.fromRGBO(212, 39, 68, 1.0),
                    hintText: 'Add a new todo items',
                    hintStyle: const TextStyle(color: Colors.redAccent),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 231, 196, 192),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(
                Icons.add,
                color: Color.fromRGBO(212, 39, 68, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
