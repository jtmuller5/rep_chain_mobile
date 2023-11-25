import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class FeedViewModelBuilder extends ViewModelBuilder<FeedViewModel> {
  const FeedViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => FeedViewModel();
}

class FeedViewModel extends ViewModel<FeedViewModel> {
   static FeedViewModel of_(BuildContext context) => getModel<FeedViewModel>(context);
}
      