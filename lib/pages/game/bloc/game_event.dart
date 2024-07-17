part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.newGame() = _newGame;

  const factory GameEvent.pause() = _pause;

  const factory GameEvent.onTap(int index) = _onTap;
}
