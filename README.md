<!--
This README describes the SlickPay API package. If you publish this package to pub.dev,
this README's contents will appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# SlickPay Dart API Package

Welcome to the SlickPay Dart API package, a powerful tool for integrating SlickPay's ePayment into your Flutter applications with ease.

## Features

- Seamless integration with SlickPay's API.
- Streamlined payment processing for your Flutter apps.
- Robust error handling and data modeling.
- Extensive documentation and code examples.

## Getting Started

To get started with the SlickPay API package, make sure you have the following prerequisites:

- Flutter and Dart installed on your development machine.
- SlickPay API credentials (API Key, etc.).

You can find detailed installation and setup instructions in the [SlickPay API documentation](https://devapi.slick-pay.com/).

## Usage

To make transfers using the SlickPay API, you can utilize the `createTransfer` function from this package. Ensure you have configured the `SlickPAYAppConfig` class with your API credentials.

```dart
import 'package:slickpayapi/slickpayapi.dart';

void main() async {

  // Initialize the SlickPay client with your API credentials.
  SlickPAYAppConfig.set(
    BaseUrl: "https://devapi.slick-pay.com/api/v2", // Set the API base URL from AppConfig
    PublicKey:  "57|74wHgIsMKIGomdIEgyBW5bSZ5Gw3vFYcfjPTF3wL", // Use your API Key from AppConfig

  );

  // Create a transfer request and process it.
  try {
    final response =   await TransferRepository.instance.createTransfer(
        amount: 1000,
        contact: "4dcbea76-fdba-4486-8e07-7942d368641f",
        url: "https://my-website.com/thank-you-page",
    );

    print('Transfer response: $response');
  } catch (e) {
    print('Failed to create transfer: $e');
  }
}
```
