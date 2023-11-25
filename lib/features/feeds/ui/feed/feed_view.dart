import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feeds/feeds_view_model.dart';
import 'feed_view_model.dart';

@RoutePage()
class FeedView extends StatelessWidget {
  const FeedView({Key? key, required this.feed}) : super(key: key);

  final Feed feed;

  @override
  Widget build(BuildContext context) {
    return FeedViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text(feed.name),
            ),
            body: ListView.builder(
              itemCount: model.messages.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(model.messages.value[index]),
                );
              },
            ),);
      },
    );
  }
}
