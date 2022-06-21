import 'dart:convert';
import 'package:collection/collection.dart';

class UnsplashModel {
  final String id;
  final Map urls;

  UnsplashModel({
    required this.id,
    required this.urls,
  });

  UnsplashModel copyWith({
    String? id,
    String? color,
    Map? urls,
  }) {
    return UnsplashModel(
      id: id ?? this.id,
      urls: urls ?? this.urls,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'urls': urls,
    };
  }

  factory UnsplashModel.fromMap(Map<String, dynamic> map) {
    return UnsplashModel(
        id: map['id'] as String,
        urls: Map.from(
          (map['urls'] as Map),
        ));
  }

  String toJson() => json.encode(toMap());

  factory UnsplashModel.fromJson(String source) =>
      UnsplashModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UnsplashModel(id: $id, urls: $urls)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is UnsplashModel &&
        other.id == id &&
        mapEquals(other.urls, urls);
  }

  @override
  int get hashCode => id.hashCode ^ urls.hashCode;
}
