class Pays {
  final String nom;
  final String capitale;
  final String population;
  final String superficie;
  final String langues;

  Pays({
    required this.nom,
    required this.capitale,
    required this.population,
    required this.superficie,
    required this.langues,
  });

  factory Pays.fromJson(Map<String, dynamic> json) {
    return Pays(
      nom: json['nom'] as String,
      capitale: json['capitale'] as String,
      population: json['population'] as String,
      superficie: json['superficie'] as String,
      langues: json['langues'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'capitale': capitale,
      'population': population,
      'superficie': superficie,
      'langues': langues,
    };
  }
}
