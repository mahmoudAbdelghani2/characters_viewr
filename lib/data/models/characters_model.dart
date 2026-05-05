class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String originName;
  final String locationName;
  final String image;
  final String url;
  final String created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.originName,
    required this.locationName,
    required this.image,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      originName: json['origin']?['name'] ?? 'Without Origin',
      locationName: json['location']?['name'] ?? 'Without location',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      created: json['created'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'origin': {'name': originName},
      'location': {'name': locationName},
      'image': image,
      'url': url,
      'created': created,
    };
  }
}
