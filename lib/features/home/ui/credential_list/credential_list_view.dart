import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'credential_list_view_model.dart';

@RoutePage()
class CredentialListView extends StatelessWidget {
  const CredentialListView({Key? key, required this.provider}) : super(key: key);

  final String provider;

  @override
  Widget build(BuildContext context) {
    return CredentialListViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text(provider),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ]),
                  child: ListTile(
                    title: const Text('Reputation'),
                    onTap: () {
                      model.getReputationCredential('12806961');
                     // model.checkReputation('12806961');
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
