import 'dart:convert';

import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/feeds/models/message.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feeds/feeds_view_model.dart';
import 'package:trinsic_dart/trinsic.dart';

class FeedViewModelBuilder extends ViewModelBuilder<FeedViewModel> {
  const FeedViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => FeedViewModel();
}

class FeedViewModel extends ViewModel<FeedViewModel> {
  TextEditingController messageController = TextEditingController();

  ValueNotifier<List<Credential>> messages = ValueNotifier([]);

  void setMessages(List<Credential> val) {
    messages.value = val;
  }

  void addMessage(Credential val) {
    messages.value = [val, ...messages.value];
  }

  @override
  void initState() {
    loadMessages();
    super.initState();
  }

  Future<void> loadMessages() async {
    Feed feed = (router.current.args as FeedRouteArgs).feed;
    TrinsicService trinsic = TrinsicService(null);
    trinsic.serviceOptions.authToken = feed.authToken;

    SearchResponse response = await trinsic.wallet().searchWallet(SearchRequest(
          query: "SELECT * FROM c WHERE c.data.type = ['VerifiableCredential', 'Message'] ORDER BY c.data.issuanceDate DESC",
        ));

    List<Credential> messages = [];

    for (var item in response.items) {
      try {
        var cred = Credential.fromJson(jsonDecode(item));
        messages.add(cred);
      } catch (e) {
        debugPrint('decode error: $e');
      }
    }
    setMessages(messages);
  }

  Future<void> sendMessage(String message) async {
    try {
      Feed feed = (router.current.args as FeedRouteArgs).feed;
      TrinsicService trinsic = TrinsicService(null);
      trinsic.serviceOptions.authToken = feed.authToken;

      IssueFromTemplateResponse response = await trinsic.credential().issueFromTemplate(
            IssueFromTemplateRequest(
              includeGovernance: false,
              templateId: 'https://schema.trinsic.cloud/eloquent-bhaskara-z2gg41u9wxxg/message',
              valuesJson: jsonEncode({
                'content': message,
              }),
            ),
          );

      debugPrint('response: ' + response.toString());

      await trinsic.credential().send(SendRequest(
            email: feed.email,
            sendNotification: false,
            documentJson: response.documentJson,
          ));

      addMessage(Credential.fromJson({
        'id': '',
        'type': 'VerifiableCredential',
      }..addAll({'data': jsonDecode(response.documentJson) as Map<String, dynamic>})));
    } catch (e) {
      debugPrint('sendMessage error: $e');
    }
  }

  static FeedViewModel of_(BuildContext context) => getModel<FeedViewModel>(context);
}
