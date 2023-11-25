import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:trinsic_dart/trinsic.dart';

class FeedsViewModelBuilder extends ViewModelBuilder<FeedsViewModel> {
  const FeedsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => FeedsViewModel();
}

class FeedsViewModel extends ViewModel<FeedsViewModel> {
  List<Feed> feeds = [
    Feed(
      name: 'General',
      email: 'jtmuller5+2@gmail.com',
      description: 'Chat with the Rep Chain community',
      authToken: const String.fromEnvironment('GENERAL_FEED_AUTH_TOKEN'),
      vcs: [],
    ),
    Feed(
      name: 'Stack Overflow',
      email: 'jtmuller5+3@gmail.com',
      description: 'Stack Overflow is the largest, most trusted online community for developers to learn, share their programming knowledge, and build their careers.',
      authToken: const String.fromEnvironment('STACK_OVERFLOW_FEED_AUTH_TOKEN'),
      vcs: [
        'stackoverflow'
      ],
    ),
  ];

  Future<void> createFeedWallet() async {
    try {
      String ecosystemId = const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID");
      CreateWalletResponse response = await TrinsicService(null).wallet().createWallet(
            CreateWalletRequest(
              identity: CreateWalletRequest_ExternalIdentity(
                identity: 'jtmuller5+2@gmail.com',
                provider: IdentityProvider.Email,
              ),
              ecosystemId: ecosystemId,
              description: 'General Feed Wallet',
            ),
          );

      debugPrint('Has Auth Token: ${response.hasAuthToken()}');
      debugPrint('Wallet: ${response.authToken}');
      debugPrint('Tokens: ${response.wallet.authTokens}');
    } catch (e) {
      debugPrint('Failed to create feed wallet: $e');
    }
  }

  static FeedsViewModel of_(BuildContext context) => getModel<FeedsViewModel>(context);
}

class Feed {
  final String name;

  final String email;

  final String description;

  final String authToken;

  final List<String> vcs;

  Feed({
    required this.name,
    required this.email,
    required this.description,
    required this.authToken,
    required this.vcs,
  });
}
