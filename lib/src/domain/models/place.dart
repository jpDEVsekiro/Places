class Place {
  int id;
  String name;
  String cep;
  String street;
  String complement;
  String neighbornhood;
  String state;
  String city;
  String number;
  int userId;

  Place(
      {required this.id,
      required this.name,
      required this.cep,
      required this.street,
      required this.complement,
      required this.neighbornhood,
      required this.state,
      required this.city,
      required this.number,
      required this.userId});

  Place.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        cep = json['cep'],
        street = json['street'],
        complement = json['complement'],
        neighbornhood = json['neighbornhood'],
        state = json['state'],
        city = json['city'],
        number = json['number'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cep': cep,
        'street': street,
        'complement': complement,
        'neighbornhood': neighbornhood,
        'state': state,
        'city': city,
        'number': number,
        'userId': userId,
      };
}
