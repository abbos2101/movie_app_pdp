import 'package:flutter/material.dart';
import 'package:movie_app/core/movie_api.dart';
import 'package:movie_app/core/movie_model.dart';

class DetailsPage extends StatefulWidget {
  final MovieModel model;

  const DetailsPage({
    super.key,
    required this.model,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final api = MovieApi();
  late MovieModel? model = widget.model;
  var loading = false;

  @override
  void initState() {
    Future(() async {
      try {
        loading = true;
        setState(() {});
        model = await api.details(id: widget.model.imdbId!);
        loading = false;
        setState(() {});
      } catch (_) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          if (model != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(width: double.infinity),
                  Image.network(
                    model!.poster ?? '',
                    height: 150,
                  ),
                  Text(model!.title!),
                  Text(model!.year ?? ''),
                  model!.actors != null
                      ? Text(model!.actors!)
                      : Container(
                          width: 120,
                          height: 20,
                          color: Colors.grey[300],
                        ),
                  const SizedBox(height: 2),
                  model!.plot != null
                      ? Text(model!.plot!)
                      : Container(
                          width: 280,
                          height: 60,
                          color: Colors.grey[300],
                        ),
                  Text(model!.boxOffice ?? ''),
                  Text(model!.response ?? ''),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
