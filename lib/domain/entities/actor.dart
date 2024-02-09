class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String? character;

  Actor({
    required this.id, 
    this.character, 
    required this.name,
    required this.profilePath,
  });

  
}
