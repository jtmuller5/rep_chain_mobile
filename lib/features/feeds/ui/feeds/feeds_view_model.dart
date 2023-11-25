import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/credentials/models/reputation.dart';
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
      vcs: ['Stack Overflow'],
    ),
    Feed(
      name: 'GitHub',
      email: 'jtmuller5+4@gmail.com',
      description:
          'GitHub is where over 65 million developers shape the future of software, together. Contribute to the open source community, manage your Git repositories, review code like a pro, track bugs and features, power your CI/CD and DevOps workflows, and secure code before you commit it.',
      authToken: const String.fromEnvironment('GITHUB_FEED_AUTH_TOKEN'),
      vcs: ['GitHub'],
    ),
    Feed(
      name: 'Reddit',
      email: 'jtmuller5+5@gmail.com',
      description: 'Reddit is a network of communities based on people\'s interests. Find communities you\'re interested in, and become part of an online community!',
      authToken: const String.fromEnvironment('REDDIT_FEED_AUTH_TOKEN'),
      vcs: ['Reddit'],
    ),
    Feed(
      name: 'Dev.to',
      email: 'jtmuller5+6@gmail.com',
      description: 'DEV Community is a community of 666,000 amazing developers',
      authToken: const String.fromEnvironment('DEV_TO_FEED_AUTH_TOKEN'),
      vcs: ['Dev.to'],
    ),
  ];

  Future<void> createFeedWallet() async {
    try {
      String ecosystemId = const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID");
      CreateWalletResponse response = await TrinsicService(null).wallet().createWallet(
            CreateWalletRequest(
              identity: CreateWalletRequest_ExternalIdentity(
                identity: 'jtmuller5+6@gmail.com',
                provider: IdentityProvider.Email,
              ),
              ecosystemId: ecosystemId,
              description: 'Dev.to Feed Wallet',
            ),
          );

      debugPrint('Has Auth Token: ${response.hasAuthToken()}');
      debugPrint('Wallet: ${response.authToken}');
      debugPrint('Tokens: ${response.wallet.authTokens}');
    } catch (e) {
      debugPrint('Failed to create feed wallet: $e');
    }
  }

  Future<bool> verifyCredential(String platform) async {
    try {
      await credentialService.loadCredentials();

      Credential? myCredential = credentialService.credentials.value.firstWhereOrNull(
        (element) => Reputation.fromJson(element.data?.credentialSubject as Map<String, dynamic>).platform == platform,
      );

      if (myCredential == null) return false;

      if (platform == 'Stack Overflow') {
        CreateProofResponse response = await credentialService.trinsic.credential().createProof(
              CreateProofRequest(itemId: myCredential.id!),
            );

        VerifyProofResponse proofResponse = await credentialService.trinsic.credential().verifyProof(VerifyProofRequest(
              proofDocumentJson: response.proofDocumentJson,
            ));

        return proofResponse.isValid;
      }

      return false;
    } catch (e) {
      debugPrint('verifyCredential error: $e');
      return false;
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
