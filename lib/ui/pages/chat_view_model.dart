import 'package:demo_blog/data/chat_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 관리자(XProvider)  watch or read 할때 실행됨
final chatProvider = StateNotifierProvider<ChatViewModel, int>((ref) {
  return ChatViewModel(0)..notifyInit();
});

// 2. 창고(ViewModel) - 상태와 행위를 가짐
class ChatViewModel extends StateNotifier<int> {
  ChatViewModel(super.state);

  void notifyInit() async {
    ChatRepository().chatStream().listen((event) {
      state = event;
    });
  }
}
