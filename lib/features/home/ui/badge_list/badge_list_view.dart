import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'badge_list_view_model.dart';

class BadgeListView extends StatelessWidget {
  const BadgeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BadgeListViewModelBuilder(
      builder: (context, model) {
        return Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onTap: () {
                        router.push(CredentialListRoute(provider: model.providers.keys.toList()[index]));
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: context.background, borderRadius: const BorderRadius.all(Radius.circular(8)), boxShadow: [
                           BoxShadow(
                            color: context.onBackground.withOpacity(.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ]),
                        child: Image.asset(model.providers.values.toList()[index]),
                      ),
                    ),
                  );
                },
                itemCount: model.providers.length)
          ],
        ));
      },
    );
  }
}
