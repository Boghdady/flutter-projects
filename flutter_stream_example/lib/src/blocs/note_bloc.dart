import 'dart:async';
import 'package:flutter_stream/src/models/note.dart';

import '../contracts/disposeable.dart';

class NoteBloc implements Disposable {
  List<Note> notes;

  // preparing to fetch list of notes
  final StreamController<List<Note>> _notesController =
      StreamController<List<Note>>();
  Stream<List<Note>> get notesStream => _notesController.stream;
  StreamSink<List<Note>> get notesSink => _notesController.sink;

  NoteBloc() {
    notes = [
      Note('1', 'Note 1'),
      Note('2', 'Note 2'),
      Note('3', 'Note 3'),
    ];
    notesSink.add(notes);
  }

  @override
  void dispose() {
    _notesController.close();
  }
}
