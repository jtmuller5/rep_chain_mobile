import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rep Chain let\'s you bring your internet reputation to a decentralized and anonymous network.',
              textAlign: TextAlign.center,
              style: context.headlineSmall,
            ).animate(effects: [
              const FadeEffect(delay: Duration(milliseconds: 300))
            ]),
            gap16,
            const Text('⛓️')
          ],
        ),
      ),
    );
  }
}
