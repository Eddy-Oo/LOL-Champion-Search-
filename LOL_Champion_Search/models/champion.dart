class Champion {
  final String name;
  final String title;
  final String blurb;
  final String imageUrl;
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;
  final String partype;
  final Map<String, dynamic> stats;

  Champion({
    required this.name,
    required this.title,
    required this.blurb,
    required this.imageUrl,
    required this.attack,
    required this.defense,
    required this.magic,
    required this.difficulty,
    required this.partype,
    required this.stats,
  });

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      name: json['name'] as String,
      title: json['title'] as String,
      blurb: json['blurb'] as String,
      imageUrl:
          "https://ddragon.leagueoflegends.com/cdn/${json['version']}/img/champion/${json['image']['full']}",
      attack: json['info']['attack'] ?? 0,
      defense: json['info']['defense'] ?? 0,
      magic: json['info']['magic'] ?? 0,
      difficulty: json['info']['difficulty'] ?? 0,
      partype: json['partype'] ?? '',
      stats: json['stats'] ?? {},
    );
  }
}
