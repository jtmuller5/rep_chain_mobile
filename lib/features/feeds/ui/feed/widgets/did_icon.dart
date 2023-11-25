import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';

class DidIcon extends StatelessWidget {
  const DidIcon({Key? key, required this.did}) : super(key: key);

  final String did;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: didService.validateDid(did),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }

          if (snapshot.data == true) {
            return const Icon(Icons.check_circle_outline, color: Colors.green);
          } else {
            return const Icon(Icons.error_outline, color: Colors.red);
          }
        });
  }
}
