import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rep_chain_mobile/app/services.dart';
import 'dart:convert';

import 'package:trinsic_dart/trinsic.dart';

class CredentialListViewModelBuilder extends ViewModelBuilder<CredentialListViewModel> {
  const CredentialListViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => CredentialListViewModel();
}

class CredentialListViewModel extends ViewModel<CredentialListViewModel> {
  Future<void> checkReputation(String userId) async {
    final url = Uri.parse('https://rep-chain.onrender.com/reputation/value?userId=$userId');
    try {
      final response = await http.get(url);

      debugPrint('response: ' + response.body.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['reputation'];
      } else {
        // Handle the case where the server did not return a 200 OK response
        debugPrint('Failed to load reputation');
        return;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      debugPrint('Error fetching reputation: $e');
      return;
    }
  }

  Future<void> getReputationCredential(String userId) async {
    final url = Uri.parse('https://rep-chain.onrender.com/reputation/issue?userId=$userId');

    try {
      final response = await http.get(url);

      debugPrint('response: ' + response.body.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // TODO move to server
        await TrinsicService(null).credential().send(
              SendRequest(
                email: credentialService.myInfo.value!.wallet.externalIdentities.firstOrNull?.id ?? '',
                documentJson: data['credential'],
                sendNotification: true,
              ),
            );
      } else {
        // Handle the case where the server did not return a 200 OK response
        debugPrint('Failed to get reputation credential: ${response.body}');
        return;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      debugPrint('Error fetching reputation credential: $e');
      return;
    }
  }

  static CredentialListViewModel of_(BuildContext context) => getModel<CredentialListViewModel>(context);
}
