class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final Geo geo;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.address,
    required this.phone,
    required this.website,
    required this.geo,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      address: Address(
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
        geo: Geo(
          lat: json['address']['geo']['lat'],
          lng: json['address']['geo']['lng'],
        ),
      ),
      geo: Geo(
        lat: json['address']['geo']['lat'],
        lng: json['address']['geo']['lng'],
      ),
      phone: json['phone'],
      website: json['website'],
      company: Company(
        name: json['company']['name'],
        catchPhrase: json['company']['catchPhrase'],
        bs: json['company']['bs'],
      ),
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });
}

class Geo {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});
}
