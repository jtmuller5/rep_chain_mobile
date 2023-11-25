import 'package:json_annotation/json_annotation.dart';

part 'credential.g.dart';

@JsonSerializable(explicitToJson: true)
class Credential {
  String? id;

  String? type;

  CredentialData? data;

  String? walletId;

  bool? isNew;


  Credential({
    this.id,
    this.type,
    this.data,
    this.walletId,
    this.isNew,
  });

  factory Credential.fromJson(Map<String, dynamic> json) => _$CredentialFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CredentialData {
  String? templateId;

  @JsonKey(name: 'include_governance')
  bool? includeGovernance;

  @JsonKey(name: '@context')
  List<dynamic>? context;

  List<String>? type;

  List<CredentialSchema>? credentialSchema;

  dynamic credentialSubject;

  String? id;

  DateTime? issuanceDate;

  CredentialStatus? credentialStatus;

  String? issuer;

  Proof? proof;

  CredentialData({
    this.templateId,
    this.includeGovernance,
    this.context,
    this.type,
    this.credentialSchema,
    this.credentialSubject,
    this.id,
    this.issuanceDate,
    this.issuer,
    this.proof,
  });

  factory CredentialData.fromJson(Map<String, dynamic> json) => _$CredentialDataFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CredentialStatus {
  String? id;

  String? type;

  String? revocationListIndex;

  String? revocationListCredential;

  CredentialStatus({
    this.id,
    this.type,
    this.revocationListIndex,
    this.revocationListCredential,
  });

  factory CredentialStatus.fromJson(Map<String, dynamic> json) => _$CredentialStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CredentialSchema {
  String? id;

  String? type;

  CredentialSchema({
    this.id,
    this.type,
  });

  factory CredentialSchema.fromJson(Map<String, dynamic> json) => _$CredentialSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialSchemaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Proof {
  String? type;

  DateTime? created;

  String? proofPurpose;

  String? proofValue;

  String? verificationMethod;

  Proof({
    this.type,
    this.created,
    this.proofPurpose,
    this.proofValue,
    this.verificationMethod,
  });

  factory Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);

  Map<String, dynamic> toJson() => _$ProofToJson(this);
}
