import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'did_details_view_model.dart';

@RoutePage()
class DidDetailsView extends StatelessWidget {
  const DidDetailsView({Key? key, required this.did}) : super(key: key);

  final String did;

  @override
  Widget build(BuildContext context) {
    return DidDetailsViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            appBar: AppBar(
              title: Text('DID Details'),
            ),
            body: Center(
          child: Text('Home'),
        ));
      },
    );
  }
}
