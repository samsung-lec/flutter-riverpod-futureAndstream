class PostRepository {
  Future<List<int>> getPosts() async {
    List<int> response = await Future.delayed(
      Duration(seconds: 1),
      () {
        return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      },
    );
    return response;
  }
}
