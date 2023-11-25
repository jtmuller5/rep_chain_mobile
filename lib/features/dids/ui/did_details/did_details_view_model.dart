import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class DidDetailsViewModelBuilder extends ViewModelBuilder<DidDetailsViewModel> {
  const DidDetailsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => DidDetailsViewModel();
}

class DidDetailsViewModel extends ViewModel<DidDetailsViewModel> {
   static DidDetailsViewModel of_(BuildContext context) => getModel<DidDetailsViewModel>(context);
}
      