import 'package:github/github.dart';

import 'repositories.dart';

class ContributorService {
  ContributorService({required GitHub gitHub}) : _gitHub = gitHub;
  final GitHub _gitHub;
  List<Contributor>? _contributors;
  List<Contributor> get contributors => _contributors ?? [];

  Future<bool> init() async {
    _contributors ??= await getContributors();
    return true;
  }

  Future<List<Contributor>> getContributors() async {
    final allContributors = <Contributor>{};

    for (var repo in repositories) {
      for (var e in (await _getRepoContributors(repo.$1, repo.$2))) {
        if (!allContributors.any((c) => e.id == c.id)) {
          allContributors.add(e);
        }
      }
    }

    return allContributors.toList();
  }

  Future<List<Contributor>> _getRepoContributors(
    String owner,
    String name,
  ) async {
    return await (_gitHub.repositories)
        .listContributors(RepositorySlug(owner, name))
        .where((c) => c.type == 'User')
        .toList();
  }
}
