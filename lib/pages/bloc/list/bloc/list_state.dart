part of 'list_bloc.dart';

@freezed
class ListState with _$ListState {
  const factory ListState.initial({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String searchText,
    @Default(1) int page,
    @Default([]) List<MovieModel> list,
    @Default(true) bool hasNext,
  }) = _Initial;
}

enum EnumStatus { initial, success, fail, loading }
