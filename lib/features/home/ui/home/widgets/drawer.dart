import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/shared/ui/app_logo.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.wallet),
                    title: const Text('Credentials'),
                    onTap: () {
                      router.push(const CredentialsRoute());
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: credentialService.myInfo,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Wallet ID:'),
                            Text(value?.wallet.walletId ?? '', style: context.bodySmall),
                            gap8,
                            const Text('Public DID:'),
                            Text(value?.wallet.publicDid ?? '', style: context.bodySmall),
                            gap8,
                            const Text('Email:'),
                            Text(value?.wallet.externalIdentities.firstOrNull?.id ?? '', style: context.bodySmall),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () async {
                  await credentialService.clearAuthToken();
                  router.pushAndPopUntil(const AuthenticateRoute(), predicate: (route) => false);
                }),
            ListTile(
                leading: const Icon(Icons.delete_forever_outlined, color: Colors.red),
                title: const Text('Delete Account'),
                onTap: () async {
                  try {
                    await credentialService.deleteWallet();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Account deleted'),
                      ));
                    }
                    router.pushAndPopUntil(const AuthenticateRoute(), predicate: (route) => false);
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  }
                }),
            const AboutListTile(
              applicationName: 'rep_chain_mobile',
              dense: true,
              applicationIcon: AppLogo(sideLength: 48),
              aboutBoxChildren: [
                Text('rep_chain_mobile is a Flutter application.'),
              ],
            ),
            FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Version: ${snapshot.data!.version}',
                      style: context.bodySmall,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
