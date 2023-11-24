import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:trinsic_dart/trinsic_dart.dart';

@lazySingleton
class CredentialService {
  var trinsic = TrinsicService(null);

  ValueNotifier<bool> authenticated = ValueNotifier(false);

  void setAuthenticated(bool val){
    authenticated.value = val;
  }

  void authenticateWallet(String authToken){
    saveAuthToken(authToken);
    setAuthenticated(true);
  }

  void saveAuthToken(String authToken){
    sharedPrefs.setString('authToken', authToken);
    trinsic.serviceOptions.authToken = authToken;
    setAuthenticated(true);
  }

  void clearAuthToken(){
    sharedPrefs.remove('authToken');
    trinsic.serviceOptions.authToken = '';
    setAuthenticated(false);
  }

  Future<GetMyInfoResponse?> getMyWallet() async {
    trinsic.serviceOptions.authToken = sharedPrefs.getString('authToken') ?? '';
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
