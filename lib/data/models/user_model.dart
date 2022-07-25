class User {
  String name;
  String lastName;
  String userName;
  String password;
  String email;
  String urlImage;

  String description;

  User({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.email,
    this.urlImage = "",
    this.description = "",
  });

  /// Create a [User] object from a JSON object.
  ///
  /// The JSON object must have the following keys:
  /// - name: The name of the user.
  /// - lastName: The last name of the user.
  /// - userName: The user name of the user.
  /// - password: The password of the user.
  /// - email: The email of the user.
  /// - urlImage: The URL of the user's image.
  /// - description: The description of the user.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      userName: json['userName'],
      password: json['password'],
      email: json['email'],
      urlImage: json['urlImage'],
      description: json['description'],
    );
  }

  /// Become [User] to JSON object.
  ///
  /// Returns a JSON object with the following keys:
  /// - name: The name of the user.
  /// - lastName: The last name of the user.
  /// - userName: The user name of the user.
  /// - password: The password of the user.
  /// - email: The email of the user.
  /// - urlImage: The URL of the user's image.
  /// - description: The description of the user.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'password': password,
      'email': email,
      'urlImage': urlImage,
      'description': description,
    };
  }

  /// Become [User] to JSON string.
  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, userName: $userName, password: $password, email: $email, urlImage: $urlImage, description: $description}';
  }
}
