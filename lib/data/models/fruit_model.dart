class Fruit {
  String genus;
  String family;
  String id;
  String name;
  Map<String, dynamic> nutritions;

  Fruit(
      {required this.genus,
      required this.family,
      required this.id,
      required this.name,
      required this.nutritions});

  /// Create a [Fruit] object from a JSON object.
  ///
  /// The JSON object must have the following keys:
  /// - genus: The genus of the fruit.
  /// - family: The family of the fruit.
  /// - id: The ID of the fruit.
  /// - name: The name of the fruit.
  /// - nutritions: A map of nutritions and their values.
  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
      genus: json['genus'],
      family: json['family'],
      id: json['id'],
      name: json['name'],
      nutritions: json['nutritions'],
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
  Map<String, dynamic> toJson() {
    return {
      'genus': genus,
      'family': family,
      'id': id,
      'name': name,
      'nutritions': nutritions,
    };
  }

  /// Become [Fruit] to JSON string.
  @override
  String toString() {
    return 'Fruit{genus: $genus, family: $family, id: $id, name: $name, nutritions: $nutritions}';
  }
}
