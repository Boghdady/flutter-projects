part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object> get props => [];
}

class Fetch extends PostEvent {
  // We are overriding toString for an easier to read string representation of our event.
  @override
  String toString() => 'Fetch Event';
}
