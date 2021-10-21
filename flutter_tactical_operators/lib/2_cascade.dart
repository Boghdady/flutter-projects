import 'package:flutter/material.dart';

List<int> withoutCascade() {
  final list = [1, 7, 2, 4];
  list.sort();
  list.removeLast();
  return list;
}

List<int> withCascade() {
  return [1, 7, 2, 4]
    ..sort()
    ..removeLast();
}

class Cascade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Without Cascade : ${withoutCascade()}");
    print("With Cascade : ${withCascade()}");
    return Container();
  }
}
