import 'dart:async';

import 'package:hacker_news/src/api/news_api_provider.dart';
import 'package:hacker_news/src/api/news_db_provider.dart';
import 'package:hacker_news/src/models/item_model.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  Future<List<int>> fetchTopIds() async {
    return await sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    for (Source source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (Cache cache in caches) {
      cache.addItem(item);
    }
    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clearItemsTable();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
  Future<int> clearItemsTable();
}
