import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feed/widgets/message_bubble.dart';
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
          body: ValueListenableBuilder(
              valueListenable: model.messages,
              builder: (context, messages, child) {
                return ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(credential: messages[index]);
                  },
                  separatorBuilder: (context, index) => gap8,
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: model.messageController,
                          decoration: InputDecoration(
                            labelText: 'Enter your message',
                          ),
                          // You can add more properties to the TextField as needed
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add logic to send the message
                            model.sendMessage(model.messageController.text);
                          },
                          child: Text('Send Message'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),

        );
      },
    );
  }
}
