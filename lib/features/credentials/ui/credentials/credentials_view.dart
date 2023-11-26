import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/credentials/ui/credentials/widgets/credential_card.dart';
import 'credentials_view_model.dart';

@RoutePage()
class CredentialsView extends StatelessWidget {
  const CredentialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CredentialsViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Credentials'),
              actions: [
                IconButton(
                    onPressed: () {
                      credentialService.loadCredentials();
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            body: ValueListenableBuilder(
                valueListenable: model.loading,
                builder: (context, loading, child) {
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ValueListenableBuilder(
                      valueListenable: credentialService.credentials,
                      builder: (context, credentials, child) {

                        if(credentials.isNotEmpty) {
                          return ListView.separated(
                            itemCount: credentials.length,
                            itemBuilder: (context, index) {
                              Credential credential = credentials[index];
                              return CredentialCard(credential: credential);
                            },
                            separatorBuilder: (context, index) => gap8,
                            padding: const EdgeInsets.all(16.0),
                          );
                        } else {
                          return const Center(child: Text('No credentials yet'));
                        }
                      });
                }));
      },
    );
  }
}
