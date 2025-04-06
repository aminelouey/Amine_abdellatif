class Patient {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String condition;
  final String lastVisit;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.condition,
    required this.lastVisit,
  });

  // Méthode pour créer un Patient à partir d'un Map
  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      gender: map['gender'],
      condition: map['condition'],
      lastVisit: map['lastVisit'],
    );
  }

  // Méthode pour convertir un Patient en Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'condition': condition,
      'lastVisit': lastVisit,
    };
  }
}
