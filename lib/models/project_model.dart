class Project {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> screenshots;
  final List<String> technologies;
  final String? projectUrl;
  final String? projectPlayStoreUrl;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.screenshots,
    required this.technologies,
    this.projectUrl,
    this.projectPlayStoreUrl,
  });
}
