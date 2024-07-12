import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_api.dart';
import 'package:movie_app/core/movie_model.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final textController = TextEditingController();
  final listController = ScrollController();
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
    listController.addListener(
      () {
        setState(() {});
        if (listController.offset / listController.position.maxScrollExtent >
            0.9) {
          if (!loading && page != -1) {
            page++;
            fetchList();
          }
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    listController.dispose();
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
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            controller: listController,
                            itemCount: list.length,
                            separatorBuilder: (_, i) =>
                                const SizedBox(height: 12),
                            itemBuilder: (_, i) {
                              final model = list[i];
                              return Row(
                                children: [
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
                              );
                            },
                          ),
                        ),
                        if (loading)
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CircularProgressIndicator(),
                          ),
                      ],
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
