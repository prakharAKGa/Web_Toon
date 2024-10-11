
import 'package:webtoon/data/data_sources/webtoon_data_source.dart';
import 'package:webtoon/domain/entities/webtoon_entity.dart';
import 'package:webtoon/domain/repo/i_webtoon_repository.dart';



class WebtoonRepository implements IWebtoonRepository {
  final WebtoonDataSource dataSource;

  WebtoonRepository(this.dataSource);

  @override
  Future<List<WebtoonEntity>> fetchWebtoons() {
    return dataSource.getWebtoons();
  }
}
