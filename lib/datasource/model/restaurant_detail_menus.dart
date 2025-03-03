class Menus {
  final List<Foods> foods;
  final List<Drinks> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) {
    return Menus(
      foods: List<Foods>.from(json['foods'].map((x) => Foods.fromJson(x))),
      drinks: List<Drinks>.from(json['drinks'].map((x) => Drinks.fromJson(x))),
    );
  }
}

class Foods {
  final String name;

  Foods({
    required this.name,
  });

  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
      name: json['name'],
    );
  }
}

class Drinks {
  final String name;

  Drinks({
    required this.name,
  });

  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      name: json['name'],
    );
  }
}
