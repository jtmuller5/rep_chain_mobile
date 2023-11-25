import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rep_chain_mobile/app/services.dart';
import 'dart:convert';

class GetCredentialViewModelBuilder extends ViewModelBuilder<GetCredentialViewModel> {
  const GetCredentialViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => GetCredentialViewModel();
}

class GetCredentialViewModel extends ViewModel<GetCredentialViewModel> {
  TextEditingController userController = TextEditingController();

  final Map<String, String> platformToUserType = {
    'Stack Overflow': 'User ID',
    'GitHub': 'Username',
    'Reddit': 'Username',
    'LinkedIn': 'Username',
    'Twitter': 'Username',
    'Dev.to': 'Username',
  };

  final Map<String, String> platformQueryString = {
    'Stack Overflow': 'stackoverflow',
    'GitHub': 'github',
    'Reddit': 'reddit',
    'LinkedIn': 'linkedin',
    'Twitter': 'twitter',
    'Dev.to': 'devto',
  };

  Future<void> getReputationCredential(String platfrom, String userId) async {
    String urlRaw = 'https://rep-chain.onrender.com/reputation/issue?userId=$userId&platform=$platfrom&email=${credentialService.myInfo.value?.wallet.externalIdentities.firstOrNull?.id ?? ''}';

    debugPrint('urlRaw: ' + urlRaw.toString());
    final url = Uri.parse(urlRaw);

    try {
      final response = await http.get(url);

      debugPrint('response: ' + response.body.toString());
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
      } else {
        // Handle the case where the server did not return a 200 OK response
        debugPrint('Failed to get reputation credential: ${response.body}');
        throw('Failed to get reputation credential: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      debugPrint('Error fetching reputation credential: $e');
      rethrow;
    }
  }

  static GetCredentialViewModel of_(BuildContext context) => getModel<GetCredentialViewModel>(context);
}
