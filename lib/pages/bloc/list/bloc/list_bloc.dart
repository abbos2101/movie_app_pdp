import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/movie_api.dart';
import 'package:movie_app/core/movie_model.dart';

part 'list_event.dart';

part 'list_state.dart';

part 'list_bloc.freezed.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final _api = MovieApi();

  ListBloc() : super(const ListState.initial()) {
    on<ListEvent>((event, emit) async {
      if (event is _search) {
        await _onSearch(event, emit);
      } else if (event is _next) {
        await _onNext(event, emit);
      }
    });
  }

  Future<void> _onSearch(_search event, Emitter<ListState> emit) async {
    emit(state.copyWith(
      status: EnumStatus.loading,
      page: 1,
      searchText: event.text,
    ));
    try {
      final list = await _api.search(text: event.text, page: state.page);
      emit(state.copyWith(
        status: EnumStatus.success,
        list: list,
      ));
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }

  Future<void> _onNext(_next event, Emitter<ListState> emit) async {
    emit(state.copyWith(
      status: EnumStatus.loading,
      page: state.page + 1,
    ));
    try {
      //state.list;
      final items = await _api.search(
        text: state.searchText,
        page: state.page,
      );
      // final list = <MovieModel>[];
      // list.addAll(state.list);
      // list.addAll(items);
      final list = <MovieModel>[...state.list, ...items];
      emit(state.copyWith(
        status: EnumStatus.success,
        list: list,
        hasNext: items.isNotEmpty,
      ));
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }
}
