
  class User{
  User({
  required this.token,
  required this.firstName,
  required this.lastName,
  required this.image,
  required this.phone,
  required this.email,
  required this.socials,
  });
  late final String token;
  late final String firstName;
  late final String lastName;
  late final String image;
  late final String phone;
  late final String email;
  late final List<dynamic> socials;

  User.fromJson(Map<String, dynamic> json){
  token = json['token'];
  firstName = json['first_name'];
  lastName = json['last_name'];
  image = json['image'];
  phone = json['phone'];
  email = json['email'];
  socials = List.castFrom<dynamic, dynamic>(json['socials']);
  }

  Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  _data['token'] = token;
  _data['first_name'] = firstName;
  _data['last_name'] = lastName;
  _data['image'] = image;
  _data['phone'] = phone;
  _data['email'] = email;
  _data['socials'] = socials;
  return _data;
  }
  }
