import 'package:flutter/material.dart';
import 'package:ds_route/pages/first_screen.dart';
import 'package:ds_route/pages/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DS ROUTE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
      //home: const MyHomePage(title: 'DS ROUTE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Progress(
            key: UniqueKey(),
          ),
          TaskList(key: UniqueKey()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          key: UniqueKey(),
          value: 0,
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TaskItem(
          key: UniqueKey(),
          label: "1",
        ),
        TaskItem(
          key: UniqueKey(),
          label: "2",
        ),
        TaskItem(
          key: UniqueKey(),
          label: "3",
        ),
        TaskItem(
          key: UniqueKey(),
          label: "4",
        ),
        TaskItem(
          key: UniqueKey(),
          label: "5",
        ),
      ],
    );
  }
}

@immutable
class TaskItem extends StatelessWidget {
  final String label;
  bool? isChecked;
  TaskItem({Key? key, required this.label, isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          key: UniqueKey(),
          value: isChecked,
          onChanged: (bool? value) {
            isChecked = value;
          },
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
