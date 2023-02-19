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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder<int>(
              stream: counterBloc.autoCounterStream.stream,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Auto: ${snapshot.data}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const Text('Loading...');
                }
              },
            ),
            StreamBuilder<int>(
              stream: counterBloc.counterStream,
              builder: (_, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.increment);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.decrement);
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterAction.reset);
            },
            child: const Icon(Icons.loop),
          ),
        ],
      ),
    );
  }
}
