import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/constants.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/app/text_theme.dart';
import 'package:rep_chain_mobile/app/theme.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:rep_chain_mobile/features/credentials/models/reputation.dart';
import 'package:rep_chain_mobile/features/credentials/services/credential_service.dart';

class CredentialCard extends StatelessWidget {
  const CredentialCard({Key? key, required this.credential}) : super(key: key);

  final Credential credential;

  @override
  Widget build(BuildContext context) {

    Reputation reputation = Reputation.fromJson(credential.data?.credentialSubject as Map<String,dynamic>);

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: context.background, borderRadius: BorderRadius.circular(8), boxShadow: [
          BoxShadow(
            color: context.onBackground.withOpacity(.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ]),
        child: ExpansionTile(
          leading: CredentialService.platformImages.keys.contains(reputation.platform ?? 'Unknown')
              ? Image.asset(
                  CredentialService.platformImages[reputation.platform ?? 'Unknown']!,
                  width: 48,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.badge),
          collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            reputation.platform ?? 'Unknown',
            style: context.titleMedium,
          ),
          expandedAlignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(reputation.value?.toStringAsFixed(0) ?? 'Value', style: context.bodyMedium.bold),
                      gap4,
                      Text(reputation.metric ?? 'Metric', style: context.bodyMedium),
                    ],
                  ),
                  Text('Issued on ${reputation.date ?? 'Unknown'}', style: context.bodyMedium),
                  Text(credential.id ?? 'DID ID', style: context.bodyMedium.secondary),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.security),
                        ),
                        gap16,
                        InkWell(
                          onTap: () async {
                            try {
                              await credentialService.deleteCredential(credential.id!);
                            } catch (e) {
                              if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            }
                          },
                          child: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
