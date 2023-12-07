import 'package:demo_blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 관리자(XProvider)  watch or read 할때 실행됨
final postProvider = StateNotifierProvider<PostViewModel, PostModel?>((ref) {
  return PostViewModel(null)..notifyInit();
});

// 2. 창고(ViewModel) - 상태와 행위를 가짐
class PostViewModel extends StateNotifier<PostModel?> {
  PostViewModel(super.state);

  void add() {
    PostModel model = state!;
    model.posts = [100, ...model.posts];
    state = PostModel(model.posts);
  }

  void notifyInit() async {
    List<int> posts = await PostRepository().getPosts();
    state = PostModel(posts);
  }
}

// 3. 창고 데이터 (Type) - 창고가 관리하는 상태값
class PostModel {
  List<int> posts;
  PostModel(this.posts);
}
