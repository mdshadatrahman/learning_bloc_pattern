import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learning_bloc_pattern/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    log('built...');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.counterStream,
          builder: (context, snapshot) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.eventSink.add(CounterAction.increment);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
