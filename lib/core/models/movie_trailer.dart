import 'package:flutter/foundation.dart';

@immutable
class MovieTrailer {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  const MovieTrailer({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieTrailer.fromMap(Map<String, dynamic> data) => MovieTrailer(
        iso6391: data['iso_639_1'] as String?,
        iso31661: data['iso_3166_1'] as String?,
        name: data['name'] as String?,
        key: data['key'] as String?,
        site: data['site'] as String?,
        size: data['size'] as int?,
        type: data['type'] as String?,
        official: data['official'] as bool?,
        publishedAt: data['published_at'] == null
            ? null
            : DateTime.parse(data['published_at'] as String),
        id: data['id'] as String?,
      );
}
