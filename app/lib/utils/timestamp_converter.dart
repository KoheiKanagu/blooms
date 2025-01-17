import 'dart:convert';

import 'package:blooms/utils/typedefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter extends JsonConverter<Timestamp?, dynamic> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }

    if (json is Timestamp) {
      return json;
    }

    if (json is int) {
      return Timestamp.fromMillisecondsSinceEpoch(json);
    }

    if (json is Map) {
      return Timestamp(
        json['_seconds'] as int,
        json['_nanoseconds'] as int,
      );
    }

    throw Exception();
  }

  @override
  Timestamp? toJson(Timestamp? object) => object;

  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';

  static Json updateServerTimestamp(Json json) {
    final result = Map<String, dynamic>.from(json);

    if (result[createdAt] == null) {
      result[createdAt] = FieldValue.serverTimestamp();
    }
    result[updatedAt] = FieldValue.serverTimestamp();

    return result;
  }

  static String toJsonString(Json json) {
    return jsonEncode(
      json,
      toEncodable: (value) {
        if (value is Timestamp) {
          return value.toDate().toIso8601String();
        }

        return 'unknown object: $value';
      },
    );
  }

  static Json addDeletedAt(Json json) {
    final result = Map<String, dynamic>.from(json);

    result['deletedAt'] = FieldValue.serverTimestamp();

    return result;
  }
}
