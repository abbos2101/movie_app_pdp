import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_api.dart';
import 'package:movie_app/core/movie_model.dart';
import 'package:movie_app/pages/set_state/details_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListPackagePage extends StatefulWidget {
  const ListPackagePage({super.key});

  @override
  State<ListPackagePage> createState() => _ListPackagePageState();
}

class _ListPackagePageState extends State<ListPackagePage> {
  final textController = TextEditingController();
  final listController = ScrollController();
  final refreshController = RefreshController();
  final api = MovieApi();
  final list = <MovieModel>[];
  int page = 1;
  var loading = false;

  Future<void> fetchList() async {
    try {
      loading = true;
      setState(() {});
      final results = await api.search(text: textController.text, page: page);
      list.addAll(results);
      loading = false;
      if (results.isEmpty) {
        page = -1;
      }
      setState(() {});
    } catch (_) {}
  }

  @override
  void initState() {
    textController.addListener(
      () {
        EasyDebounce.debounce(
          'my-debouncer',
          const Duration(milliseconds: 300),
          () async {
            page = 1;
            list.clear();
            fetchList();
          },
        );
      },
    );
    listController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    listController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search: $page"),
        centerTitle: true,
      ),
      floatingActionButton: Builder(builder: (context) {
        if (listController.hasClients &&
            listController.offset > MediaQuery.of(context).size.height) {
          return FloatingActionButton(
            onPressed: () {
              listController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            },
            child: const Icon(Icons.upgrade_outlined),
          );
        }
        return const SizedBox();
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: textController),
            const SizedBox(height: 12),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (loading && list.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (list.isNotEmpty) {
                    return SmartRefresher(
                      controller: refreshController,
                      enablePullDown: false,
                      enablePullUp: page != -1,
                      onLoading: () async {
                        page++;
                        await fetchList();
                        refreshController.loadComplete();
                      },
                      child: ListView.separated(
                        controller: listController,
                        itemCount: list.length,
                        separatorBuilder: (_, i) => const SizedBox(height: 12),
                        itemBuilder: (_, i) {
                          final model = list[i];
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
                  }
                  return const Center(child: Text("Text"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
