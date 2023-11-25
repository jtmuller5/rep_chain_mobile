import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';

class BadgeListViewModelBuilder extends ViewModelBuilder<BadgeListViewModel> {
  const BadgeListViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => BadgeListViewModel();
}

class BadgeListViewModel extends ViewModel<BadgeListViewModel> {
  final Map<String, String> providers = {
    'Stack Overflow': 'assets/images/stack_overflow.png',
    'GitHub': 'assets/images/github.png',
    'LinkedIn': 'assets/images/linkedin.png',
    'Twitter': 'assets/images/twitter.png',
  };

  static BadgeListViewModel of_(BuildContext context) => getModel<BadgeListViewModel>(context);
}
