import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:trinsic_dart/trinsic_dart.dart';

@lazySingleton
class CredentialService {
  var trinsic = TrinsicService(null);

  Future<void> createWallet(String email) async {
    try {
      String ecosystemId = const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID");

      debugPrint('ecosystemId: $ecosystemId');
      CreateWalletResponse newWallet = await trinsic.wallet().createWallet(
            CreateWalletRequest(
              ecosystemId: const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID"),
              identity: CreateWalletRequest_ExternalIdentity(
                identity: email,
                provider: IdentityProvider.Email, // Email, Phone, Passkey
              ),
            ),
          );
      trinsic.serviceOptions.authToken = newWallet.authToken;
      GetMyInfoResponse walletInfo = await trinsic.wallet().getMyInfo();
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(walletInfo.writeToJsonMap());
      debugPrint(prettyprint);
    } catch (e) {
      debugPrint('createWallet error: $e');
    }
  }

  Future<void> getWallet(String id) async {
    var trinsic = TrinsicService(null);
    await trinsic.wallet().getWalletInfo(GetWalletInfoRequest(walletId: id));
  }

  Future<void> getCredentials() async {
    var trinsic = TrinsicService(null);
    await trinsic.wallet().getItem(GetItemRequest(itemId: "default"));
  }
}
