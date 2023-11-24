import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
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
            title: const Text('New Wallet'),
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
              Text('Please enter your email address. This will be used to recover your wallet if you lose your device.', style: context.bodyMedium.secondary),
              gap16,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton.outlined(
                    onPressed: () async {
                      try {
                        await model.createWallet();
                        router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
                      } catch (e) {
                        debugPrint('createWallet error: $e');
                      }
                    },
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: model.loading.value ? const SizedBox(height: 24, width: 24,child: CircularProgressIndicator()) : const Icon(Icons.arrow_forward),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
