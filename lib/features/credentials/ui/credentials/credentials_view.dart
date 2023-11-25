import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
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
                IconButton(onPressed: (){
                  model.loadCredentials();
                }, icon: Icon(Icons.refresh))
              ],
            ),
            body: ValueListenableBuilder(
                valueListenable: model.loading,
                builder: (context, loading, child) {
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: model.credentials.value.length,
                    itemBuilder: (context, index) {
                      Credential credential = model.credentials.value[index];
                      return DecoratedBox(
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
                        ]),
                        child: ListTile(
                          title:  Text(credential.data!.type.toString()),
                          onTap: () {
                          },
                        ),
                      );
                    },
                    padding: const EdgeInsets.all(16.0),
                  );
                }));
      },
    );
  }
}
