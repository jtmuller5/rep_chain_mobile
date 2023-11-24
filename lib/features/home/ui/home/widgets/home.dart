import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          OutlinedButton(
              onPressed: () async {
                await credentialService.getMyWallet();
              },
              child: const Text('My Wallet')),
        ],
      ),
    );
  }
}
