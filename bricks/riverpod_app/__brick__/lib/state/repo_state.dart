import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';

part 'repo_state.g.dart';

const token = '<Github Token>';

final options = BaseOptions(
    baseUrl: 'https://api.github.com',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
    headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
    },
);
final dio = Dio(options);

const repoList = [
  'flutter/flutter'
];

class Repo {
  Repo(this.id);

  final String id;
  String? name;
  String? description;

  async fetch() async {
    final resp = await dio.get('/repos/$id');
    name = resp.data['name'];
    description = resp.data['description'];
  }
}

@riverpod
Stream<List<Repo>> repos(ref) {
  return Stream.periodic(
    Duration(hours: 1),
    (_) => repoList
  ).startWith(repoList)
  .asyncMap((List<List<String>> list) async {
    final List<Repo> newList = await Future.wait(list.map<Future<Repo>>((e) async {
        final repo = Repo(e);
        await repo.fetch();
        return repo;
    }));
    return newList.toList();
  });
}
