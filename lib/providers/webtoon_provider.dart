import 'package:flutter/material.dart';
import 'package:webtoon/domain/entities/webtoon_entity.dart';

import '../../domain/use_cases/fetch_webtoons_use_case.dart';

class WebtoonProvider with ChangeNotifier {
  final FetchWebtoonsUseCase fetchWebtoonsUseCase;
  List<WebtoonEntity> webtoons = [];
  bool isLoading = false;

  WebtoonProvider(this.fetchWebtoonsUseCase);

  Future<void> loadWebtoons() async {
    isLoading = true;
    notifyListeners();

    try {
      webtoons = await fetchWebtoonsUseCase();
      print('Webtoons Loaded: ${webtoons.length}');
    } catch (e) {
      print('Error loading webtoons: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
