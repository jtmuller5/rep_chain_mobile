import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:trinsic_dart/trinsic.dart';

class VerifyWalletViewModelBuilder extends ViewModelBuilder<VerifyWalletViewModel> {
  const VerifyWalletViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => VerifyWalletViewModel();
}

class VerifyWalletViewModel extends ViewModel<VerifyWalletViewModel> {
  TextEditingController codeController = TextEditingController();

  /// Verify the code sent to the user's email
  Future<void> verifyCode() async {
    try {
      String challenge = (router.current.args as VerifyWalletRouteArgs).challenge;
      // Verify the code sent to the user's email
      AuthenticateConfirmResponse response = await TrinsicService(null).wallet().authenticateConfirm(AuthenticateConfirmRequest(
            challenge: challenge,
            response: codeController.text,
          ));

      debugPrint('response: ' + response.toString());
    } catch (e) {
      debugPrint('error: ' + e.toString());
      rethrow;
    }
  }

  static VerifyWalletViewModel of_(BuildContext context) => getModel<VerifyWalletViewModel>(context);
}
