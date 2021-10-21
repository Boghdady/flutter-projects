import 'dart:io';

// This method will read json file and convert it to String
String fixtureReader(String name) =>
    File('test/fixtures/$name').readAsStringSync();
