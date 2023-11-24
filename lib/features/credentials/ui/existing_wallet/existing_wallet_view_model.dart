import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:trinsic_dart/trinsic.dart';

class ExistingWalletViewModelBuilder extends ViewModelBuilder<ExistingWalletViewModel> {
  const ExistingWalletViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => ExistingWalletViewModel();
}

class ExistingWalletViewModel extends ViewModel<ExistingWalletViewModel> {
  TextEditingController emailController = TextEditingController();

  /// Initiate a wallet authentication flow
  Future<String?> sendVerificationCode() async {
    try {
      // Create a challenge and send the code to the user's email
      AuthenticateInitResponse response = await TrinsicService(null).wallet().authenticateInit(
        AuthenticateInitRequest(
          identity: emailController.text,
          provider: IdentityProvider.Email,
          ecosystemId: const String.fromEnvironment("TRINSIC_ECOSYSTEM_ID"),
        ),
      );

      debugPrint('response: ' + response.toString());

      return response.challenge;
    } catch (e) {
      debugPrint('error: ' + e.toString());
      rethrow;
    }
  }

  static ExistingWalletViewModel of_(BuildContext context) => getModel<ExistingWalletViewModel>(context);
}
