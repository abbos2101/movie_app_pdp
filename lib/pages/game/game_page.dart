import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/game_bloc.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final bloc = GameBloc()..add(const GameEvent.newGame());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocListener<GameBloc, GameState>(
        listener: (context, state) {
          if (state.finished) {
            //print("FINISHED");
            // showDialog(
            //   context: context,
            //   builder: (context) => const Text("Yutdingiz!"),
            // );
          }
        },
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: const Text("15 Puzzle")),
              body: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Count: ${state.count}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.list.length,
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (_, i) {
                        final model = state.list[i];
                        if (model == 0) {
                          return Container(color: Colors.blue.withOpacity(0.2));
                        }
                        return GestureDetector(
                          onTap: () => bloc.add(GameEvent.onTap(i)),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            alignment: Alignment.center,
                            color: Colors.blue,
                            child: Text(
                              "$model",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoButton(
                        child: const Text("Pause"),
                        onPressed: () {
                          bloc.add(const GameEvent.pause());
                        },
                      ),
                      CupertinoButton(
                        child: const Text("NewGame"),
                        onPressed: () {
                          bloc.add(const GameEvent.newGame());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
