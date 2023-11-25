import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

@injectable
class DidService {
  Future<bool> validateDid(String did) async {
    final url = Uri.parse('https://didlint.ownyourdata.eu/api/validate/$did');
    try {
      final response = await http.get(url);

      debugPrint('response: ' + response.body.toString());
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData['valid'] ?? false;
      } else {
        // Handle non-200 responses
        return false;
      }
    } catch (e) {
      // Handle any errors that occur during the request
      return false;
    }
  }
}
