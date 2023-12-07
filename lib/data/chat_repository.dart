class ChatRepository {
  Stream<int> chatStream() async* {
    int i = 0;

    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield i++;
    }
  }
}
