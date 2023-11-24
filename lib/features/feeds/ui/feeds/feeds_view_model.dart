import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class FeedsViewModelBuilder extends ViewModelBuilder<FeedsViewModel> {
  const FeedsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => FeedsViewModel();
}

class FeedsViewModel extends ViewModel<FeedsViewModel> {
   static FeedsViewModel of_(BuildContext context) => getModel<FeedsViewModel>(context);
}
      