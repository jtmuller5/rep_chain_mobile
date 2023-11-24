import 'package:flutter/material.dart';
import 'feeds_view_model.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedsViewModelBuilder(
        builder: (context, model) {
          return Scaffold(
            body: Center(
              child: Text('Home'),
            )
          );
        },
      );
  }
}
      