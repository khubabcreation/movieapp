class MovieDetails {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetails({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetails.fromMap(Map<String, dynamic> data) => MovieDetails(
        adult: data['adult'] as bool?,
        backdropPath: data['backdrop_path'] as String?,
        belongsToCollection: data['belongs_to_collection'] as dynamic,
        budget: data['budget'] as int?,
        genres: (data['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        homepage: data['homepage'] as String?,
        id: data['id'] as int?,
        imdbId: data['imdb_id'] as String?,
        originalLanguage: data['original_language'] as String?,
        originalTitle: data['original_title'] as String?,
        overview: data['overview'] as String?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        posterPath: data['poster_path'] as String?,
        productionCompanies: (data['production_companies'] as List<dynamic>?)
            ?.map((e) => ProductionCompany.fromMap(e as Map<String, dynamic>))
            .toList(),
        productionCountries: (data['production_countries'] as List<dynamic>?)
            ?.map((e) => ProductionCountry.fromMap(e as Map<String, dynamic>))
            .toList(),
        releaseDate: data['release_date'] as String?,
        revenue: data['revenue'] as int?,
        runtime: data['runtime'] as int?,
        spokenLanguages: (data['spoken_languages'] as List<dynamic>?)
            ?.map((e) => SpokenLanguage.fromMap(e as Map<String, dynamic>))
            .toList(),
        status: data['status'] as String?,
        tagline: data['tagline'] as String?,
        title: data['title'] as String?,
        video: data['video'] as bool?,
        voteAverage: (data['vote_average'] as num?)?.toDouble(),
        voteCount: data['vote_count'] as int?,
      );
}

class Genre {
  const Genre({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory Genre.fromMap(Map<String, dynamic> data) => Genre(
        id: data['id'] as int?,
        name: data['name'] as String?,
      );
}

class ProductionCompany {
  const ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory ProductionCompany.fromMap(Map<String, dynamic> data) {
    return ProductionCompany(
      id: data['id'] as int?,
      logoPath: data['logo_path'] as String?,
      name: data['name'] as String?,
      originCountry: data['origin_country'] as String?,
    );
  }
}

class ProductionCountry {
  const ProductionCountry({
    this.iso31661,
    this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountry.fromMap(Map<String, dynamic> data) {
    return ProductionCountry(
      iso31661: data['iso_3166_1'] as String?,
      name: data['name'] as String?,
    );
  }
}

class SpokenLanguage {
  const SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  final String? englishName;
  final String? iso6391;
  final String? name;

  factory SpokenLanguage.fromMap(Map<String, dynamic> data) {
    return SpokenLanguage(
      englishName: data['english_name'] as String?,
      iso6391: data['iso_639_1'] as String?,
      name: data['name'] as String?,
    );
  }
}
