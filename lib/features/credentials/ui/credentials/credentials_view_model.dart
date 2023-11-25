import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';

class CredentialsViewModelBuilder extends ViewModelBuilder<CredentialsViewModel> {
  const CredentialsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => CredentialsViewModel();
}

class CredentialsViewModel extends ViewModel<CredentialsViewModel> {
  @override
  initState() {
    super.initState();
    loading.value = true;
    credentialService.loadCredentials().then((value) {
      loading.value = false;
    });
  }

  static CredentialsViewModel of_(BuildContext context) => getModel<CredentialsViewModel>(context);
}
