import 'dart:convert';

import 'package:flutter/services.dart';

class JsonToModel<T> {
  Future<T> toModel({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final jsonString = await rootBundle.loadString(key);

    final Map<String, dynamic> jsonList = json.decode(jsonString);

    return fromJson(jsonList);
  }
}
