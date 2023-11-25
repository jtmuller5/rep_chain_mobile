import 'dart:convert';
import 'dart:developer';

import 'package:code_on_the_rocks/code_on_the_rocks.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/credentials/models/credential.dart';
import 'package:trinsic_dart/trinsic.dart';

class CredentialsViewModelBuilder extends ViewModelBuilder<CredentialsViewModel> {
  const CredentialsViewModelBuilder({
    super.key,
    required super.builder,
  });

  @override
  State<StatefulWidget> createState() => CredentialsViewModel();
}

class CredentialsViewModel extends ViewModel<CredentialsViewModel> {
  ValueNotifier<List<Credential>> credentials = ValueNotifier([]);

  void setCredentials(List<Credential> val) {
    credentials.value = val;
  }

  @override
  initState() {
    super.initState();
    loadCredentials();
  }

  Future<void> loadCredentials() async {
    setLoading(true);
    try {
      SearchResponse response = await credentialService.trinsic.wallet().searchWallet(SearchRequest());

      log('Items: ' + response.items.toString());
      List<Credential> creds = [];
     // get Credentials from json
      for (var item in response.items) {
        try {
          var cred = Credential.fromJson(jsonDecode('{"id":"urn:uuid:b69bcf82974a4551bdf8bdf6484d1375","type":"VerifiableCredential","data":{"@context":["https://www.w3.org/2018/credentials/v1","https://w3id.org/bbs/v1",{"@vocab":"https://trinsic.cloud/eloquent-bhaskara-z2gg41u9wxxg/"}],"type":["VerifiableCredential","StackOverflowReputation"],"credentialSchema":[{"id":"https://schema.trinsic.cloud/eloquent-bhaskara-z2gg41u9wxxg/stackoverflowreputation","type":"JsonSchemaValidator2018"}],"credentialSubject":{"userId":"12806961","checkDate":"2023-11-25T03:50:31.697Z","id":"urn:vc:subject:0"},"id":"urn:vc","issuanceDate":"2023-11-25T03:50:31Z","credentialStatus":{"id":"https://eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud/credential-status/DLa3D98Gpi6eMwmauhy9oQ#8","type":"RevocationList2020Status","revocationListIndex":"8","revocationListCredential":"https://eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud/credential-status/DLa3D98Gpi6eMwmauhy9oQ"},"issuer":"did:web:eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud:zRu8EGN6oNCwYjHUAmpQLwd","proof":{"type":"BbsBlsSignature2020","created":"2023-11-25T03:50:31Z","proofPurpose":"assertionMethod","proofValue":"t6KW0IXpuPrtDAzGmRQTjDVHPeU\u002B7YpHDfgp/RNo3wSeVM6U0NSkWLSZwPIuMB3fHC\u002BvS6K1cOGwh0sHnPQOFQZCrt6Oke573YcmeShYIjJW6bjPdvtpPCpONic2oJ8qSCAD7DFo2HvdusDczlbYjA==","verificationMethod":"did:web:eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud:zRu8EGN6oNCwYjHUAmpQLwd#t7bSJv6ljv_o1d8sWeWx4u3Qgnj_Qug-va7LrkTtjfo"}}}'));
          creds.add(cred);
        } catch (e) {
          debugPrint('decode error: $e');
        }
      }
      setCredentials(creds);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      setLoading(false);
    }
  }

  static CredentialsViewModel of_(BuildContext context) => getModel<CredentialsViewModel>(context);
}
