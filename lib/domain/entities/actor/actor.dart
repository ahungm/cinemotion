class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String? role;

  const Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    this.role,
  });
}
