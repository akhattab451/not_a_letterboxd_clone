import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/models.dart';

abstract class BaseNewsRepository {
  Future<List<News>> getNews({required int page});
}

class NewsRepository implements BaseNewsRepository {
  @override
  Future<List<News>> getNews({required int page}) async {
    final response = await rootBundle.loadString(
      'assets/docs/news.json',
    );
    final List<dynamic> news = json.decode(response);
    return news.map((e) => News.fromJson(e)).toList();
  }
}
