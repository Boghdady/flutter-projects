import 'package:flutter/material.dart';

void withCoalescing() {
  String myValue;
  String fullback = "fullback";
  // normal way to check value if null
  String result = myValue == null ? fullback : myValue;
  print(result);
}

void withoutCoalescing() {
  String myValue;
  String fullback = "fullback";
  // if myValue is null then result = fullback;
  // else result = myValue
  String result = myValue ?? fullback;
  print(result);
}

void assignment() {
  String initializedValue = "something";
  String uninitializedValue;

  // if initializedValue = null then initializedValue = new value
  // else don't do anything
  initializedValue ??= "new value";
  // if uninitializedValue = null then uninitializedValue = new value
  // else don't do anything'
  uninitializedValue ??= "new value";

  print(" initializedValue : $initializedValue");
  print(" uninitializedValue : $uninitializedValue");
}

void access() {
  String initializedValue = "something";
  String uninitializedValue;

  print(" initializedValue : ${initializedValue?.toUpperCase()}");
  print(" uninitializedValue : ${uninitializedValue?.toUpperCase()}");
}

void spread() {
  List<int> collection;
  final anotherCollection = [1, 2, 3];

  final result = [...?collection, ...?anotherCollection];
  print(result);
}

class NullAware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    withCoalescing();
//    withoutCoalescing();
//    assignment();
//    access();
    spread();
    return Scaffold();
  }
}
