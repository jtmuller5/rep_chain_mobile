// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credential _$CredentialFromJson(Map<String, dynamic> json) => Credential(
      id: json['id'] as String?,
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : CredentialData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CredentialToJson(Credential instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'data': instance.data?.toJson(),
    };

CredentialData _$CredentialDataFromJson(Map<String, dynamic> json) =>
    CredentialData(
      templateId: json['templateId'] as String?,
      includeGovernance: json['include_governance'] as bool?,
      context: json['@context'] as List<dynamic>?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      credentialSchema: (json['credentialSchema'] as List<dynamic>?)
          ?.map((e) => CredentialSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentialSubject: json['credentialSubject'] == null
          ? null
          : CredentialSubject.fromJson(
              json['credentialSubject'] as Map<String, dynamic>),
      id: json['id'] as String?,
      issuanceDate: json['issuanceDate'] == null
          ? null
          : DateTime.parse(json['issuanceDate'] as String),
      issuer: json['issuer'] as String?,
      proof: json['proof'] == null
          ? null
          : Proof.fromJson(json['proof'] as Map<String, dynamic>),
    )..credentialStatus = json['credentialStatus'] == null
        ? null
        : CredentialStatus.fromJson(
            json['credentialStatus'] as Map<String, dynamic>);

Map<String, dynamic> _$CredentialDataToJson(CredentialData instance) =>
    <String, dynamic>{
      'templateId': instance.templateId,
      'include_governance': instance.includeGovernance,
      '@context': instance.context,
      'type': instance.type,
      'credentialSchema':
          instance.credentialSchema?.map((e) => e.toJson()).toList(),
      'credentialSubject': instance.credentialSubject?.toJson(),
      'id': instance.id,
      'issuanceDate': instance.issuanceDate?.toIso8601String(),
      'credentialStatus': instance.credentialStatus?.toJson(),
      'issuer': instance.issuer,
      'proof': instance.proof?.toJson(),
    };

CredentialStatus _$CredentialStatusFromJson(Map<String, dynamic> json) =>
    CredentialStatus(
      id: json['id'] as String?,
      type: json['type'] as String?,
      revocationListIndex: json['revocationListIndex'] as String?,
      revocationListCredential: json['revocationListCredential'] as String?,
    );

Map<String, dynamic> _$CredentialStatusToJson(CredentialStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'revocationListIndex': instance.revocationListIndex,
      'revocationListCredential': instance.revocationListCredential,
    };

CredentialSchema _$CredentialSchemaFromJson(Map<String, dynamic> json) =>
    CredentialSchema(
      id: json['id'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CredentialSchemaToJson(CredentialSchema instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

CredentialSubject _$CredentialSubjectFromJson(Map<String, dynamic> json) =>
    CredentialSubject(
      userId: json['userId'] as String?,
      checkDate: json['checkDate'] == null
          ? null
          : DateTime.parse(json['checkDate'] as String),
      reputation: json['reputation'] as int?,
    );

Map<String, dynamic> _$CredentialSubjectToJson(CredentialSubject instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'checkDate': instance.checkDate?.toIso8601String(),
      'reputation': instance.reputation,
    };

Proof _$ProofFromJson(Map<String, dynamic> json) => Proof(
      type: json['type'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      proofPurpose: json['proofPurpose'] as String?,
      proofValue: json['proofValue'] as String?,
      verificationMethod: json['verificationMethod'] as String?,
    );

Map<String, dynamic> _$ProofToJson(Proof instance) => <String, dynamic>{
      'type': instance.type,
      'created': instance.created?.toIso8601String(),
      'proofPurpose': instance.proofPurpose,
      'proofValue': instance.proofValue,
      'verificationMethod': instance.verificationMethod,
    };
