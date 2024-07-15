part of 'list_bloc.dart';

@freezed
class ListEvent with _$ListEvent {
  const factory ListEvent.search({required String text}) = _search;

  const factory ListEvent.next() = _next;

// const factory ListEvent.find({
//   required String text,
//   String? name,
//   @Default(2024) int year,
//   @Default(false) bool hasUser,
//   @Default([]) List<int> users,
//   required MovieModel model,
// }) = _find;
}
