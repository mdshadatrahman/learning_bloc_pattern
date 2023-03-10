import 'package:flutter/material.dart';
import 'package:learning_bloc_pattern/counter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // TextButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const TestWidget(),
            //       ),
            //     );
            //   },
            //   child: const Text('Go next'),
            // ),
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

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New page'),
      ),
      body: const Center(
        child: Text('New page'),
      ),
    );
  }
}
