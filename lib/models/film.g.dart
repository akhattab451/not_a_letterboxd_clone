// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      id: json['id'] as int,
      title: json['title'] as String,
      year: Film._extractYear(json['release_date'] as String?),
      posterUrl: Film._addBaseUrl(json['poster_path'] as String?),
    );
