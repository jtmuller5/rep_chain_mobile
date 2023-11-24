import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'existing_wallet_view_model.dart';

@RoutePage()
class ExistingWalletView extends StatelessWidget {
  const ExistingWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExistingWalletViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Existing Wallet'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextField(
                  controller: model.emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                gap16,
                Text('Please enter your email address. We will send a verification code that can be used to authenticate your wallet.', style: context.bodyMedium.secondary),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton.outlined(
                        onPressed: () async {
                          try {
                            String? challenge = await model.sendVerificationCode();
                            router.push( VerifyWalletRoute(challenge: challenge!));
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(e.toString()),
                              ));
                            }
                          }
                        },
                        icon: const Icon(Icons.arrow_forward))
                  ],
                )
              ],
            ));
      },
    );
  }
}
