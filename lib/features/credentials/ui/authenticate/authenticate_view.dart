import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'authenticate_view_model.dart';

@RoutePage()
class AuthenticateView extends StatelessWidget {
  const AuthenticateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticateViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            body: ValueListenableBuilder(
                valueListenable: model.loading,
                builder: (context, loading, child) {
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SafeArea(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/logo.png'),
                              Text(
                                'Welcome to Rep Chain',
                                style: context.headlineSmall,
                                textAlign: TextAlign.center,
                              ),
                              gap16,
                              Text(
                                'Bring your Web2 reputation to Web3',
                                style: context.bodySmall,
                                textAlign: TextAlign.center,
                              ),
                              gap32,
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () async {
                                          router.push(const ExistingWalletRoute());
                                        },
                                        child: const Text('Use existing wallet')),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                        onPressed: () async {
                                          router.push(const NewWalletRoute());
                                        },
                                        child: const Text('Create new wallet')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }));
      },
    );
  }
}
