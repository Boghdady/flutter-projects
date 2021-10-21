import 'package:hacker_news/src/api/news_api_provider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test_api/test_api.dart';

void main() {
  // 1 - test fetchTopIds method
  test('FetchTopIds returns a list of ids', () async {
    final newsApiProvider = NewsApiProvider();
    // setup of test case
    newsApiProvider.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    List<int> ids = await newsApiProvider.fetchTopIds();
    // expectation
    expect(ids, [1, 2, 3, 4]);
  });

  // 2 - test fetchItem method
  test('FetchItem return an item model', () async {
    final newsApiProvider = NewsApiProvider();
    newsApiProvider.client = MockClient((request) async {
      return Response(json.encode({'id': 123}), 200);
    });
    final itemModel = await newsApiProvider.fetchItem(123);

    expect(itemModel.id, 123);
  });
}
