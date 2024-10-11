

import 'package:webtoon/domain/entities/webtoon_entity.dart';
import 'package:webtoon/domain/repo/i_webtoon_repository.dart';

class FetchWebtoonsUseCase {
  final IWebtoonRepository repository;

  FetchWebtoonsUseCase(this.repository);

  Future<List<WebtoonEntity>> call() {
    return repository.fetchWebtoons();
  }
}
