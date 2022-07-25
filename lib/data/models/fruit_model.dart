class Fruit {
  String genus;
  String family;
  int? id;
  String name;
  Map<String, dynamic> nutritions;
  String? createdBy;

  /// Create a new fruit.
  ///
  /// The [id] is optional. If not provided, it will be generated.
  /// The [createdBy] is optional and is the user name who created the fruit.
  /// The [nutritions] is required and must be a map with the nutritions of the fruit.
  /// The [nutritions] must have the following keys:
  /// - calories
  /// - protein
  /// - fat
  /// - carbohydrates
  /// - sugar
  /// The [name] is required and must be a string.
  /// The [genus] is required and must be a string.
  ///  The [family] is required and must be a string.
  Fruit(
      {required this.genus,
      required this.family,
      this.id,
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
    try {
      return Fruit(
        genus: json['genus'],
        family: json['family'],
        id: json['id'],
        name: json['name'],
        nutritions: json['nutritions'],
        createdBy: json['createdBy'],
      );
    } catch (e) {
      return Fruit(
        genus: '',
        family: '',
        id: null,
        name: '',
        nutritions: {},
        createdBy: '',
      );
    }
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
