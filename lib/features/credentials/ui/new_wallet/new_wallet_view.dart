import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'new_wallet_view_model.dart';

@RoutePage()
class NewWalletView extends StatelessWidget {
  const NewWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewWalletViewModelBuilder(
        builder: (context, model) {
          return Scaffold(
            appBar: AppBar(
              title: Text('New Wallet'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                gap16,
                Text(
                  'Please enter your email address. This will be used to recover your wallet if you lose your device.'
                      ,style: context.bodyMedium.secondary
                ),
                gap16,
                Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],)
              ],
            )
          );
        },
      );
  }
}
      