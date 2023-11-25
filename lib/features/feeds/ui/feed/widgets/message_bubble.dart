import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/feeds/models/message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.credential}) : super(key: key);

  final Credential credential;

  @override
  Widget build(BuildContext context) {
    Message message = Message.fromJson(credential.data!.credentialSubject as Map<String, dynamic>);

    String content = message.content ?? '';
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
      child: ListTile(
        title: Text(content),
        subtitle: Text(MaterialLocalizations.of(context).formatCompactDate(credential.data?.issuanceDate ?? DateTime.now()) + ' ' + MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.fromDateTime(credential.data?.issuanceDate ?? DateTime.now())),
        style: context.bodySmall.tertiary,),
      ),
    );
  }
}
