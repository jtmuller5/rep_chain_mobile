import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class NewWalletViewModelBuilder extends ViewModelBuilder<NewWalletViewModel> {
  const NewWalletViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => NewWalletViewModel();
}

class NewWalletViewModel extends ViewModel<NewWalletViewModel> {
   static NewWalletViewModel of_(BuildContext context) => getModel<NewWalletViewModel>(context);
}
      