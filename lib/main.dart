
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon/data/data_sources/webtoon_data_source.dart';
import 'package:webtoon/domain/repo/webtoon_repository.dart';
import 'package:webtoon/domain/use_cases/fetch_webtoons_use_case.dart';
import 'package:webtoon/providers/favorite_provider.dart';
import 'package:webtoon/providers/webtoon_provider.dart';
import 'package:webtoon/screens/home_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final webtoonRepository = WebtoonRepository(WebtoonDataSource());
    final fetchWebtoonsUseCase = FetchWebtoonsUseCase(webtoonRepository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => WebtoonProvider(fetchWebtoonsUseCase),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()..loadFavorites()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Webtoon Explorer',
        home: HomeScreen(),
      ),
    );
  }
}
