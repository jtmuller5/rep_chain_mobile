import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:trinsic_dart/trinsic.dart';

class NewWalletViewModelBuilder extends ViewModelBuilder<NewWalletViewModel> {
  const NewWalletViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => NewWalletViewModel();
}

class NewWalletViewModel extends ViewModel<NewWalletViewModel> {
  TextEditingController emailController = TextEditingController();

  TrinsicService trinsic = TrinsicService(null);

  /// Create a new wallet for a given email address
  Future<void> createWallet() async {
    setLoading(true);
    try {
      String ecosystemId = const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID");

      debugPrint('ecosystemId: $ecosystemId');
      CreateWalletResponse newWallet = await trinsic.wallet().createWallet(
        CreateWalletRequest(
          ecosystemId: const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID"),
          identity: CreateWalletRequest_ExternalIdentity(
            identity: emailController.text,
            provider: IdentityProvider.Email, // Email, Phone, Passkey
          ),
        ),
      );

      credentialService.saveAuthToken(newWallet.authToken);

    } catch (e) {
      debugPrint('createWallet error: $e');
    } finally {
      setLoading(false);
    }
  }

  static NewWalletViewModel of_(BuildContext context) => getModel<NewWalletViewModel>(context);
}
