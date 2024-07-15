import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../set_state/details_page.dart';
import 'bloc/list_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final bloc = ListBloc();
  final textController = TextEditingController();
  final refreshController = RefreshController();

  @override
  void initState() {
    textController.addListener(
      () {
        EasyDebounce.debounce(
          'my-debouncer',
          const Duration(milliseconds: 300),
          () => bloc.add(ListEvent.search(text: textController.text)),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    textController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<ListBloc, ListState>(
        listener: (context, state) {
          if (state.status == EnumStatus.success ||
              state.status == EnumStatus.fail) {
            refreshController.loadComplete();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("Search: ${state.page}")),
            body: Column(
              children: [
                TextField(controller: textController),
                const SizedBox(height: 12),
                Expanded(
                  child: Builder(builder: (context) {
                    if (state.status == EnumStatus.loading &&
                        state.list.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.status == EnumStatus.success &&
                        state.list.isEmpty) {
                      return const Center(child: Text("Movie is not found"));
                    }
                    return SmartRefresher(
                      controller: refreshController,
                      enablePullDown: false,
                      enablePullUp: state.hasNext,
                      onLoading: () => bloc.add(const ListEvent.next()),
                      child: ListView.separated(
                        itemCount: state.list.length,
                        separatorBuilder: (_, i) => const SizedBox(height: 12),
                        itemBuilder: (_, i) {
                          final model = state.list[i];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailsPage(model: model),
                                ),
                              );
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Row(
                              children: [
                                if ((model.poster ?? '').startsWith('http'))
                                  Image.network(
                                    model.poster ?? '',
                                    height: 120,
                                    width: 120,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: Placeholder(),
                                      );
                                    },
                                  ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${i + 1}',
                                        style: const TextStyle(fontSize: 28),
                                      ),
                                      Text(
                                        model.title ?? '',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        model.year ?? '',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
