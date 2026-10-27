class Horse {
  final String sellerName;
  final String name;
  final String breed;
  final String height;
  final String description;

  Horse({
    required this.sellerName,
    required this.name,
    required this.breed,
    required this.height,
    required this.description,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'sellerName': sellerName,
      'name': name,
      'breed': breed,
      'height': height,
      'description': description,
    };
  }
}