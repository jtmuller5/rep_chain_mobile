import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'feeds_view_model.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedsViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
          body: Stack(
            children: [
              ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: model.feeds.length,
                separatorBuilder: (context, index) => gap8,
                itemBuilder: (context, index) {
                  Feed feed = model.feeds[index];
                  return Animate(
                    effects: const [
                      SlideEffect(
                        begin: Offset(0, 0.2),
                        end: Offset(0, 0),
                      )
                    ],
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onTap: () async {
                        if (feed.vcs.isEmpty) {
                          router.push(FeedRoute(feed: feed));
                        } else {
                          bool verified = await model.verifyCredential(feed.vcs.first);

                          if (verified) {
                            router.push(FeedRoute(feed: feed));
                          } else {
                            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You are not authorized to view this feed')));
                          }
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: context.background,
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: context.onBackground.withOpacity(.1)),
                            boxShadow: [
                              BoxShadow(
                                color: context.onBackground.withOpacity(.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(feed.name),
                              subtitle: Text(feed.description),
                            ),
                            if (feed.vcs.isEmpty)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text("Open", style: context.bodyMedium.copyWith(color: Colors.green)),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Icon(
                                  Icons.lock,
                                  color: context.onBackground.withOpacity(.5),
                                ),
                              ),
                            gap8,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: model.unlocking,
                builder: (context, value, child) {
                  if (value) {
                    return Container(
                      color: Colors.black.withOpacity(.5),
                      child: const Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Unlocking...', style: TextStyle(color: Colors.white),),
                          gap8,
                          CircularProgressIndicator(),
                        ],
                      )),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
          /*floatingActionButton: FloatingActionButton(
              onPressed: () {
                model.createFeedWallet();
              },
              child: const Icon(Icons.add),
            )*/
        );
      },
    );
  }
}
