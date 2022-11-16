import 'dart:async';

import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  StreamController<int> _streamController = StreamController.broadcast();
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("Counter ${snapshot.data}");
              },
              initialData: 0,
              stream: _streamController.stream,
            ),
            StreamBuilder<int>(
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text("Counter ${snapshot.data}");
              },
              initialData: 0,
              stream: _streamController.stream,
            ),
          ],
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          FloatingActionButton(
              onPressed: () {
                _streamController.sink.add(++count);
              },
              child: Icon(Icons.add)),
          FloatingActionButton(
              onPressed: () {
                _streamController.sink.add(--count);
              },
              child: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
