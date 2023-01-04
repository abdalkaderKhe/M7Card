class Shop {
  Shop({
    required this.id,
    required this.slug,
    this.title,
    required this.shopName,
    required this.ratingCount,
    required this.reviewsCount,
    required this.logo,
    required this.banner,
    required this.image_90x60,
    required this.image_82x82,
    required this.image_617x145,
  });
  late final int id;
  late final String slug;
  late final String? title;
  late final String shopName;
  late final int ratingCount;
  late final int reviewsCount;
  late final String logo;
  late final String banner;
  late final String image_90x60;
  late final String image_82x82;
  late final String image_617x145;

  Shop.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    shopName = json['shop_name'];
    ratingCount = json['rating_count'];
    reviewsCount = json['reviews_count'];
    logo = json['logo'];
    banner = json['banner'];
    image_90x60 = json['image_90x60'];
    image_82x82 = json['image_82x82'];
    image_617x145 = json['image_617x145'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['shop_name'] = shopName;
    _data['rating_count'] = ratingCount;
    _data['reviews_count'] = reviewsCount;
    _data['logo'] = logo;
    _data['banner'] = banner;
    _data['image_90x60'] = image_90x60;
    _data['image_82x82'] = image_82x82;
    _data['image_617x145'] = image_617x145;
    return _data;
  }
}