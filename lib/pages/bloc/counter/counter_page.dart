import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("Counter Page"),
            ),
            body: Center(
              child: state.isLoading ? const CircularProgressIndicator() : Text("${state.count}"),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  heroTag: '1',
                  onPressed: () {
                    bloc.add(CounterEvent.increment());
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  heroTag: '2',
                  onPressed: () {
                    bloc.add(CounterEvent.dicrement());
                  },
                  child: const Icon(Icons.text_decrease),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
