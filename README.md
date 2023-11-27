# Rep Chain Mobile

Bring your Web2 reputation to Web3.

# Getting Started

## Config.json

In the assets folder of your project, fill in the missing environment variables in the config.json file.

The following variable will come from RevenueCat:

- TRINSIC_AUTH_TOKEN

# Verifiable Credentials

## Reputation

```agsl
{
    "id": "urn:uuid:2212834080ad4addb8b2c8710af21525",
    "type": "VerifiableCredential",
    "data": {
        "@context": [
            "https://www.w3.org/2018/credentials/v1",
            "https://w3id.org/bbs/v1",
            {
                "@vocab": "https://trinsic.cloud/eloquent-bhaskara-z2gg41u9wxxg/"
            }
        ],
        "type": [
            "VerifiableCredential",
            "Reputation"
        ],
        "credentialSchema": [
            {
                "id": "https://schema.trinsic.cloud/eloquent-bhaskara-z2gg41u9wxxg/reputation",
                "type": "JsonSchemaValidator2018"
            }
        ],
        "credentialSubject": {
            "User": "ufohitchhiker",
            "Value": 19128,
            "Date": "2023-11-25T16:17:10.564Z",
            "Platform": "Reddit",
            "Metric": "Karma",
            "id": "urn:vc:subject:0"
        },
        "id": "urn:vc",
        "issuanceDate": "2023-11-25T16:17:10Z",
        "credentialStatus": {
            "id": "https://eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud/credential-status/GFqjd4b62eiNWSdjdKc1J#5",
            "type": "RevocationList2020Status",
            "revocationListIndex": "5",
            "revocationListCredential": "https://eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud/credential-status/GFqjd4b62eiNWSdjdKc1J"
        },
        "issuer": "did:web:eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud:zRu8EGN6oNCwYjHUAmpQLwd",
        "proof": {
            "type": "BbsBlsSignature2020",
            "created": "2023-11-25T16:17:10Z",
            "proofPurpose": "assertionMethod",
            "proofValue": "o9jqIJYV6o/W69yexnwC8EJSdXwF8kQwGvuTXnbf7i7bE89jP7Lc4vhDBvnZN0OOMKVg9X44OT7IyqxonIH7xLuNJjBkG7KYma9urLMBCo4x5JoTWPaG1p7URXapIpy1ng+avITVXJin9XQoxPxyNA==",
            "verificationMethod": "did:web:eloquent-bhaskara-z2gg41u9wxxg.connect.trinsic.cloud:zRu8EGN6oNCwYjHUAmpQLwd#t7bSJv6ljv_o1d8sWeWx4u3Qgnj_Qug-va7LrkTtjfo"
        }
    },
    "walletId": "urn:trinsic:wallets:zRu8EGN6oNCwYjHUAmpQLwd",
    "isNew": true,
    "resourceInfo": {
        "created": 1700929030,
        "createdIsGuess": false
    },
    "_rid": "0E1sAPaF7cIb0AYAAAAAAA==",
    "_self": "dbs/0E1sAA==/colls/0E1sAPaF7cI=/docs/0E1sAPaF7cIb0AYAAAAAAA==/",
    "_etag": "\"bb03fa82-0000-0100-0000-65621e060000\"",
    "_attachments": "attachments/",
    "_ts": 1700929030
}
```

# Deployment

## Android

### Sign App
```agsl
keytool -genkey -v -keystore ~path/to/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

### First Release
The `flutter build` command defaults to using the release build configuration. To create a release build, run the following command:
```agsl
flutter build appbundle
```

```agsl
flutter build appbundle --dart-define-from-file=assets/config.json
```

### Subsequent Releases
Run the Fastlanes:
```agsl
cd android
fastlane internal
```

## IOS

### First Release
```agsl
flutter build ipa
```

### Subsequent Releases
Run the Fastlanes:
```agsl
cd ios
fastlane beta
```

### Shorebird

To use Shorebird, follow
the getting started steps in the [official docs](https://docs.shorebird.dev/).

### IOS Screenshots

Devices for [screenshots](https://stackoverflow.com/questions/53297870/wrong-screenshot-size-in-xcode-10-using-simulator):

- 6.5 inch - iPhone 12 Pro Max
- 5.5 inch - iPhone 8 Plus
- iPad Pro (3rd gen) - iPad Pro (12.9 inch)
- iPad Pro(2nd gen) - iPad Pro (12.9 inch)

# Miscellaneous

- Occasionally, you may need to update th distributionUrl in android/gradle/wrapper/gradle-wrapper.properties to the latest version of gradle. You can
  find the latest version [here](https://services.gradle.org/distributions/).

# Resources 
- https://github.com/trinsic-id/sdk-examples/tree/main/trinsic_flutter