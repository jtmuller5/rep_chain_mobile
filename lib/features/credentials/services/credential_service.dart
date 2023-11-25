import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:trinsic_dart/trinsic_dart.dart';

@lazySingleton
class CredentialService {
  var trinsic = TrinsicService(null);

  ValueNotifier<GetMyInfoResponse?> myInfo = ValueNotifier(null);

  void setMyInfo(GetMyInfoResponse? val) {
    myInfo.value = val;
  }

  ValueNotifier<bool> authenticated = ValueNotifier(false);

  void setAuthenticated(bool val) {
    authenticated.value = val;
  }

  ValueNotifier<List<Credential>> credentials = ValueNotifier([]);

  void setCredentials(List<Credential> val) {
    credentials.value = val;
  }

  void authenticateWallet(String authToken) {
    saveAuthToken(authToken);
    setAuthenticated(true);
  }

  void saveAuthToken(String authToken) {
    debugPrint('AuthToken: $authToken');
    sharedPrefs.setString('authToken', authToken);
    trinsic.serviceOptions.authToken = authToken;
    setAuthenticated(true);
  }

  Future<void> clearAuthToken() async {
    await sharedPrefs.remove('authToken');
    trinsic.serviceOptions.authToken = '';
    setAuthenticated(false);
  }

  // response: wallet: {
  //   name: urn:trinsic:wallets:z3J7d3DzMesstaCpEya6Qa5
  //   email: jtmuller5+1@gmail.com
  //   walletId: urn:trinsic:wallets:z3J7d3DzMesstaCpEya6Qa5
  //   publicDid: did:web:eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud:z3J7d3DzMesstaCpEya6Qa5
  //   authTokens: {
  //     id: ae5dca89-f677-4be3-8daf-2d610d0d1ebd
  //     description: Initial auth token
  //     dateCreated: 2023-11-24T19:44:35.7237790Z
  //   }
  //   externalIdentityIds: jtmuller5+1@gmail.com
  //   ecosystemId: urn:trinsic:ecosystems:eloquent-bhaskara-z2gg41u9wxxg
  //   externalIdentities: {
  //     provider: Email
  //     id: jtmuller5+1@gmail.com
  //   }
  // }
  Future<GetMyInfoResponse?> getMyWallet() async {
    trinsic.serviceOptions.authToken = sharedPrefs.getString('authToken') ?? '';
    try {
      GetMyInfoResponse response = await trinsic.wallet().getMyInfo();

      setMyInfo(response);
      debugPrint('response: ' + response.toString());
      if (response.hasWallet()) {
        setAuthenticated(true);
      }
      return response;
    } catch (e) {
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

  Future<void> deleteWallet() async {
    try {
      await trinsic.wallet().deleteWallet(DeleteWalletRequest(
            email: myInfo.value?.wallet.externalIdentities.firstOrNull?.id ?? '',
          ));
      await clearAuthToken();
    } catch (e) {
      debugPrint('deleteWallet error: $e');
      rethrow;
    }
  }

  Future<void> getWallet(String id) async {
    await trinsic.wallet().getWalletInfo(GetWalletInfoRequest(walletId: id));
  }

  Future<void> getCredentials() async {
    await trinsic.wallet().getItem(GetItemRequest(itemId: "default"));
  }

  Future<void> deleteCredential(String itemId) async {
    try {
      await trinsic.wallet().deleteItem(DeleteItemRequest(itemId: itemId));
      List<Credential> updatedCredentials = credentials.value;
      updatedCredentials.removeWhere((element) => element.id == itemId);
      setCredentials(updatedCredentials);
      debugPrint('deleteCredential success');
    } catch (e) {
      debugPrint('deleteCredential error: $e');
      rethrow;
    }
  }

  Future<void> loadCredentials() async {

    try {
      SearchResponse response = await credentialService.trinsic.wallet().searchWallet(SearchRequest());

      log('Items: ' + response.items.toString());
      List<Credential> creds = [];
      // get Credentials from json
      for (var item in response.items) {
        try {
          var cred = Credential.fromJson(jsonDecode(item));
          creds.add(cred);
        } catch (e) {
          debugPrint('decode error: $e');
        }
      }
      setCredentials(creds);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static Map<String,String> platformImages = {
    'Stack Overflow': 'assets/images/stack_overflow.png',
    'GitHub': 'assets/images/github.png',
    'Reddit': 'assets/images/reddit.png',
    'LinkedIn': 'assets/images/linkedin.png',
    'Twitter': 'assets/images/twitter.png',
    'Dev.to': 'assets/images/dev.png',
  };
}
