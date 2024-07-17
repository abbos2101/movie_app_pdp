import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_event.dart';

part 'game_state.dart';

part 'game_bloc.freezed.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState.initial()) {
    on<GameEvent>((event, emit) async {
      if (event is _newGame) {
        await _onNewGame(event, emit);
      } else if (event is _pause) {
        await _onPause(event, emit);
      } else if (event is _onTap) {
        await _onOnTap(event, emit);
      }
    });
  }

  Future<void> _onNewGame(
    _newGame event,
    Emitter<GameState> emit,
  ) async {
    while (true) {
      final list = List.generate(16, (i) => i)..shuffle();
      //final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0, 13, 14, 15];
      if (_isSolvable(list)) {
        emit(state.copyWith(
          list: list,
          finished: false,
        ));
        break;
      }
    }
  }

  Future<void> _onPause(
    _pause event,
    Emitter<GameState> emit,
  ) async {}

  Future<void> _onOnTap(
    _onTap event,
    Emitter<GameState> emit,
  ) async {
    event.index;
    final list = <int>[];
    list.addAll(state.list);
    final indexZero = list.indexOf(0);
    final clZero = indexZero % 4;
    final clItem = event.index % 4;
    final rwZero = indexZero ~/ 4;
    final rwItem = event.index ~/ 4;

    bool condition = (clZero == clItem && (rwItem - rwZero).abs() == 1) ||
        (rwZero == rwItem && (clItem - clZero).abs() == 1);
    if (condition) {
      list[indexZero] = list[event.index];
      list[event.index] = 0;
      emit(state.copyWith(
        list: list,
        count: state.count + 1,
      ));
      if (_isFinished(list)) {
        emit(state.copyWith(finished: true));
      }
    }
  }
}

bool _isSolvable(List<int> puzzle) {
  int n = 4; // Since it's a 15-puzzle, the grid is 4x4
  int inversions = 0;

  // Count inversions
  for (int i = 0; i < puzzle.length; i++) {
    for (int j = i + 1; j < puzzle.length; j++) {
      if (puzzle[i] != 0 && puzzle[j] != 0 && puzzle[i] > puzzle[j]) {
        inversions++;
      }
    }
  }

  // Find the row position of the blank space (0)
  int blankRow = 0;
  for (int i = 0; i < puzzle.length; i++) {
    if (puzzle[i] == 0) {
      blankRow = n - (i ~/ n); // Calculate the row from the bottom
      break;
    }
  }

  // Check solvability
  if (n % 2 != 0) {
    // If grid width is odd
    return inversions % 2 == 0;
  } else {
    // If grid width is even
    if (blankRow % 2 == 0) {
      return inversions % 2 != 0;
    } else {
      return inversions % 2 == 0;
    }
  }
}

bool _isFinished(List<int> list) {
  for (int i = 0; i < 15; i++) {
    if (list[i] != i + 1) {
      return false;
    }
  }
  return true;
}
