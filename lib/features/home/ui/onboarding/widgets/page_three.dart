import 'package:flutter/gestures.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: context.headlineSmall, children: [
                const TextSpan(text: 'And follow us on Twitter '),
                TextSpan(
                  text: '@CodeOnTheRocks_',
                  style: context.headlineSmall
                      .copyWith(color: Colors.lightBlueAccent),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                          Uri.parse('https://twitter.com/CodeOnTheRocks_'));
                    },
                ),
              ]),
            ).animate(effects: [
              const FadeEffect(delay: Duration(milliseconds: 300))
            ]),
            gap16,
            const Text('🍹')
          ],
        ),
      ),
    );
  }
}
