import 'package:demo_blog/ui/pages/chat_view_model.dart';
import 'package:demo_blog/ui/pages/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 창고 관리자 - 창고 - 창고데이터 (null)
    PostModel? model = ref.watch(postProvider);
    int chatNum = ref.watch(chatProvider);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      List<int> posts = model.posts;

      return Scaffold(
        appBar: AppBar(title: Text("Riverpod And Future")),
        body: Stack(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text("title ${posts[index]}"),
                  subtitle: Text("subtitle ${posts[index]}"),
                );
              },
            ),
            Positioned(
              left: 200,
              top: 300,
              child: Container(
                color: Colors.yellow,
                child: Text("${chatNum}", style: TextStyle(fontSize: 50)),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(postProvider.notifier).add();
          },
          child: Icon(Icons.add),
        ),
      );
    }
  }
}
