class UserProfile {
  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.image,
    required this.facebook,
    required this.twitter,
    required this.linkedin,
    required this.instagram,
    required this.pinterest,
    required this.youtube,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String gender;
  late final String dateOfBirth;
  late final String image;
  late final String facebook;
  late final String twitter;
  late final String linkedin;
  late final String instagram;
  late final String pinterest;
  late final String youtube;

  UserProfile.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    image = json['image'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    instagram = json['instagram'];
    pinterest = json['pinterest'];
    youtube = json['youtube'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['gender'] = gender;
    _data['date_of_birth'] = dateOfBirth;
    _data['image'] = image;
    _data['facebook'] = facebook;
    _data['twitter'] = twitter;
    _data['linkedin'] = linkedin;
    _data['instagram'] = instagram;
    _data['pinterest'] = pinterest;
    _data['youtube'] = youtube;
    return _data;
  }
}