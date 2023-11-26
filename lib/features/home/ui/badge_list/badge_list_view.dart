import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'package:rep_chain_mobile/features/credentials/models/reputation.dart';
import 'badge_list_view_model.dart';

class BadgeListView extends StatelessWidget {
  const BadgeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BadgeListViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            body: ValueListenableBuilder(
                valueListenable: credentialService.credentials,
                builder: (context, credentials, child) {
                  return CustomScrollView(
                    slivers: [
                      SliverGrid.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                          ),
                          itemBuilder: (context, index) {
                            String provider = model.providers.keys.toList()[index];
                            bool hasCredential = credentials.any((element) => (Reputation.fromJson(element.data!.credentialSubject as Map<String, dynamic>).platform == provider));

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Animate(
                                effects: [
                                  SlideEffect(
                                    begin: const Offset(0, 0.2),
                                    end: const Offset(0, 0),
                                    delay: Duration(milliseconds: 100 * index),
                                  ),
                                  const FadeEffect(),
                                ],
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  onTap: () {
                                    if (!hasCredential) {
                                      router.push(GetCredentialRoute(platform: provider));
                                    } else {
                                      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You already have this credential')));
                                    }
                                  },
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: context.background,
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        border: Border.all(color: hasCredential ? Colors.green : context.onBackground.withOpacity(.1), width: hasCredential ? 4 : 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: context.onBackground.withOpacity(.1),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        model.providers.values.toList()[index],
                                        color: Theme.of(context).brightness == Brightness.light ? null : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: model.providers.length)
                    ],
                  );
                }));
      },
    );
  }
}
