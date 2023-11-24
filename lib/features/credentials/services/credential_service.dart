import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:trinsic_dart/trinsic_dart.dart';

@lazySingleton
class CredentialService {
  var trinsic = TrinsicService(null);

  ValueNotifier<bool> authenticated = ValueNotifier(false);

  void setAuthenticated(bool val){
    authenticated.value = val;
  }

  void checkAuthentication() {

  }

  Future<GetMyInfoResponse?> getMyWallet() async {
    try {
      GetMyInfoResponse response = await trinsic.wallet().getMyInfo();

      debugPrint('response: ' + response.toString());
      if(response.hasWallet()){
        setAuthenticated(true);
      }
      return response;
    } catch(e) {
      debugPrint('getMyWallet error: $e');
      return null;
    }
  }

  /// Create a new wallet for a given email address
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

  Future<void> attachWallet() async {
    try {
      GetWalletFromExternalIdentityResponse response = await trinsic.wallet().getWalletFromExternalIdentity(
            GetWalletFromExternalIdentityRequest(
              identity: WalletExternalIdentity(
                id: 'jtmuller5@gmail.com',
                provider: IdentityProvider.Email,
              ),
            ),
          );

      debugPrint('response: ' + response.toString());
    } catch (e) {
      debugPrint('attachWallet error: $e');
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
