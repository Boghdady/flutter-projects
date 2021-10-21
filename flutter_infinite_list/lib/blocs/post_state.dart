part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

/*
  Will tell the presentation layer needs to render a loading indicator while
  the initial batch of posts are loaded
 */
class PostUninitialized extends PostState {}

/*
  PostError- will tell the presentation layer that an error
  has occurred while fetching posts
 */
class PostError extends PostState {
  final String errorMsg;

  PostError(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

/*
  Will tell the presentation layer it has content to render,
  properties :
  - posts :  will be the List<Post> which will be displayed
  - hasReachedMax : will tell the presentation layer whether or
      not it has reached the maximum number of posts
 */
class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostLoaded({this.posts, this.hasReachedMax});

  // copyWith so that we can copy an instance of PostLoaded and update zero or more properties conveniently
  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
}
