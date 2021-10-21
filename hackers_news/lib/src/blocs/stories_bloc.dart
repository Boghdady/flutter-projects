import 'package:hacker_news/src/api/repository.dart';
import 'package:hacker_news/src/models/item_model.dart';

import 'bloc_Provider.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class StoriesBloc implements BlocBase {
  final _repository = Repository();

  // 1- Define stream controller
  PublishSubject<List<int>> _topIds = PublishSubject<List<int>>();
  PublishSubject<int> _itemsInput = PublishSubject<int>();
  BehaviorSubject<Map<int, Future<ItemModel>>> _itemsOutput =
      BehaviorSubject<Map<int, Future<ItemModel>>>();

  // 2- Retrieve data from stream
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;
  // Constructor
  StoriesBloc() {
    // to create only one instance of stream
    _itemsInput.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
    fetchTopIds();
  }

  // add data to stream
  fetchTopIds() async {
    List<int> ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  Function(int) get fetchItem => _itemsInput.sink.add;

  _itemsTransformer() {
    return ScanStreamTransformer(
      // This method invoked for every new item , args { 1- map , 2- id to fetch item by id , 3- number of invoked }
      (Map<int, Future<ItemModel>> cacheMap, int id, index) {
        print('number of infoked items = $index');
        cacheMap[id] = _repository.fetchItem(id);
        return cacheMap;
      },
      // define initial empty map
      <int, Future<ItemModel>>{},
    );
  }

  clearCache() {
    return _repository.clearCache();
  }

  @override
  void dispose() {
    _topIds.close();
    _itemsOutput.close();
    _itemsInput.close();
  }
}
