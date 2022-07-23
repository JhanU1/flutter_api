class Fruit {
  String genus;
  String family;
  String id;
  String name;
  Map<String, dynamic> nutritions;
  String? createdBy;

  Fruit(
      {required this.genus,
      required this.family,
      required this.id,
      required this.name,
      required this.nutritions,
      this.createdBy});

  /// Create a [Fruit] object from a JSON object.
  ///
  /// The JSON object must have the following keys:
  /// - genus: The genus of the fruit.
  /// - family: The family of the fruit.
  /// - id: The ID of the fruit.
  /// - name: The name of the fruit.
  /// - nutritions: A map of nutritions and their values.
  /// - createdBy: The user name of the user who created the fruit.
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      genus: json['genus'],
      family: json['family'],
      id: json['id'],
      name: json['name'],
      nutritions: json['nutritions'],
      createdBy: json['createdBy'],
    );
  }

  /// Become [Fruit] to JSON object.
  ///
  /// Returns a JSON object with the following keys:
  /// - genus: The genus of the fruit.
  /// - family: The family of the fruit.
  /// - id: The ID of the fruit.
  /// - name: The name of the fruit.
  /// - nutritions: A map of nutritions and their values.
  /// - createdBy: The user name of the user who created the fruit.
  Map<String, dynamic> toJson() {
    return {
      'genus': genus,
      'family': family,
      'id': id,
      'name': name,
      'nutritions': nutritions,
      'createdBy': createdBy,
    };
  }

  /// Become [Fruit] to JSON string.
  @override
  String toString() {
    return 'Fruit{genus: $genus, family: $family, id: $id, name: $name, nutritions: $nutritions, createdBy: $createdBy}';
  }
}
