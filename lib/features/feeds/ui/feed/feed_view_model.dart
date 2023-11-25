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
  ValueNotifier<List<String>> messages = ValueNotifier([]);

  void setMessages(List<String> val) {
    messages.value = val;
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

    SearchResponse response = await trinsic.wallet().searchWallet(SearchRequest());

    List<String> messages = [];

    for (var item in response.items) {
      try {
        var cred = Credential.fromJson(jsonDecode(item));
        messages.add((cred.data?.credentialSubject as Message).content ?? '');
      } catch (e) {
        debugPrint('decode error: $e');
      }
    }
  }

  static FeedViewModel of_(BuildContext context) => getModel<FeedViewModel>(context);
}
