
import 'package:webtoon/domain/entities/webtoon_entity.dart';


abstract class IWebtoonRepository {
  Future<List<WebtoonEntity>> fetchWebtoons();
}
