part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.initial({
    @Default([]) List<int> list,
    @Default(0) int count,
    @Default(false) bool finished,
  }) = _Initial;
}
