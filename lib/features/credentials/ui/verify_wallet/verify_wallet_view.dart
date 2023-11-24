import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'verify_wallet_view_model.dart';

@RoutePage()
class VerifyWalletView extends StatelessWidget {
  const VerifyWalletView({Key? key, required this.challenge}) : super(key: key);

  final String challenge;

  @override
  Widget build(BuildContext context) {
    return VerifyWalletViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Verify Wallet'),
            ),
            body: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextField(
                  controller: model.codeController,
                  decoration: const InputDecoration(
                    labelText: 'Code',
                  ),
                ),
                gap16,
                Text('Please enter the code sent to your email address.', style: context.bodyMedium.secondary),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton.outlined(
                        onPressed: () async {
                          try {
                            await model.verifyCode();

                            router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
                          } catch (e) {
                            if (context.mounted) {
                              if (e.toString().contains('invalid confirmation code')) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Invalid code'),
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(e.toString()),
                                ));
                              }
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
