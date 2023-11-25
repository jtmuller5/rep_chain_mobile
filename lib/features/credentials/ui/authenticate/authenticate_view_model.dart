import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:trinsic_dart/trinsic.dart';

class AuthenticateViewModelBuilder extends ViewModelBuilder<AuthenticateViewModel> {
  const AuthenticateViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => AuthenticateViewModel();
}

class AuthenticateViewModel extends ViewModel<AuthenticateViewModel> {
  var trinsic = TrinsicService(null);

  String? challenge;

  @override
  void initState() {
    loading.value = true;
    credentialService.getMyWallet().then((value) {
      if (credentialService.authenticated.value) {
        router.replace(const HomeRoute());
      } else {
        loading.value = false;
      }
    });
    super.initState();
  }

  static AuthenticateViewModel of_(BuildContext context) => getModel<AuthenticateViewModel>(context);
}
