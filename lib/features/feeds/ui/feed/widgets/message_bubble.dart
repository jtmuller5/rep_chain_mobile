import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/feeds/models/message.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feed/feed_view_model.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feed/widgets/did_icon.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feeds/feeds_view_model.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.credential}) : super(key: key);

  final Credential credential;

  @override
  Widget build(BuildContext context) {
    FeedViewModel model = FeedViewModel.of_(context);
    Message message = Message.fromJson(credential.data!.credentialSubject as Map<String, dynamic>);

    String content = message.content ?? '';
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: context.background,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: context.onBackground.withOpacity(.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text('Message Details', style: context.titleMedium.bold),
                    gap16,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DID', style: context.bodyMedium.bold),
                              Text(credential.id ?? '', style: context.bodyMedium),
                            ],
                          ),
                        ),
                        gap8,
                        DidIcon(did: credential.id ?? ''),
                      ],
                    ),
                    gap8,
                    const Divider(),
                    gap8,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Issuer', style: context.bodyMedium.bold),
                              Text(credential.data?.issuer ?? '', style: context.bodyMedium),
                            ],
                          ),
                        ),
                        gap8,
                        DidIcon(did: credential.data?.issuer ?? ''),
                      ],
                    ),
                    gap8,
                    const Divider(),
                    gap8,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Feed', style: context.bodyMedium.bold),
                              Text(credential.walletId ?? '', style: context.bodyMedium),
                            ],
                          ),
                        ),
                        gap8,
                        DidIcon(did: credential.walletId ?? ''),
                      ],
                    ),
                  ],
                ),
              );
            });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.background,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: context.onBackground.withOpacity(.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: ListTile(
          title: Text(content),
          subtitle: Text(
            MaterialLocalizations.of(context).formatCompactDate(credential.data?.issuanceDate ?? DateTime.now()) +
                ' ' +
                MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.fromDateTime(credential.data?.issuanceDate ?? DateTime.now())),
            style: context.bodySmall.tertiary,
          ),
        ),
      ),
    );
  }
}
