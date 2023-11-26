import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:rep_chain_mobile/features/credentials/services/credential_service.dart';
import 'get_credential_view_model.dart';

@RoutePage()
class GetCredentialView extends StatelessWidget {
  const GetCredentialView({Key? key, required this.platform}) : super(key: key);

  final String platform;

  @override
  Widget build(BuildContext context) {
    return GetCredentialViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Get Credential for $platform'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextField(
                  controller: model.userController,
                  decoration: InputDecoration(
                    labelText: model.platformToUserType[platform],
                  ),
                ),
                gap16,
                Text('Please enter your $platform ${model.platformToUserType[platform]}', style: context.bodyMedium),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton.outlined(
                        onPressed: () async {
                          try {
                            await model.getReputationCredential(CredentialService.platformQueryString[platform]!, model.userController.text);
                            await credentialService.loadCredentials();
                            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credential issued successfully')));
                            router.replace(const CredentialsRoute());
                          } catch (e) {
                            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                          }
                        },
                        icon: ValueListenableBuilder(
                            valueListenable: model.issuingCredential,
                            builder: (context, issuing, child) {
                              return issuing
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Icon(Icons.check);
                            }))
                  ],
                )
              ],
            ));
      },
    );
  }
}
