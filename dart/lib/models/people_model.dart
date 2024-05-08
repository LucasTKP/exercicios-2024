class PeopleModel {
  PeopleModel({
    required this.name,
    required this.instituition,
    required this.picture,
    required this.role,
  });

  final String name;
  final String instituition;
  final String? picture;
  final String role;

  factory PeopleModel.fromJson(Map<String, dynamic> json) {
    return PeopleModel(
      name: json['name'].trimLeft() ?? '',
      instituition: json['institution'] ?? '',
      picture: json['picture'],
      role: json['role']['label']['pt-br'] ?? '',
    );
  }


  @override
  String toString() {
    return 'PeopleModel(name: $name, instituition: $instituition, picture: $picture, role: $role)';
  }
}
