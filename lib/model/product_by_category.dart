class ProductByCategory{
  ProductByCategory({
    required this.id,
    required this.slug,
    required this.title,
    required this.shortDescription,
    required this.specialDiscountType,
    required this.specialDiscount,
    required this.discountPrice,
    required this.formattedPrice,
   // required this.formattedDiscount,
    required this.image,
    required this.price,
    required this.rating,
    required this.game,
    required this.isGame,
    required this.totalReviews,
    required this.currentStock,
    required this.reward,
    required this.minimumOrderQuantity,
    required this.isFavourite,
  });
  late final int id;
  late final String slug;
  late final String title;
  late final String shortDescription;
  late final String specialDiscountType;
  late final int specialDiscount;
  late final int discountPrice;
  late final String formattedPrice;
 // late final String formattedDiscount;
  late final String image;
  late final String? game;
  late final int? isGame;
  late final int price;
  late final int rating;
  late final int totalReviews;
  late final int currentStock;
  late final int reward;
  late final int minimumOrderQuantity;
  late final bool isFavourite;

  ProductByCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    shortDescription = json['short_description'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    formattedPrice = json['formatted_price'];
   // formattedDiscount = json['formatted_discount'];
    isGame = json['is_game'];
    game = json['game'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    totalReviews = json['total_reviews'];
    currentStock = json['current_stock'];
    reward = json['reward'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slug'] = slug;
    _data['title'] = title;
    _data['short_description'] = shortDescription;
    _data['special_discount_type'] = specialDiscountType;
    _data['special_discount'] = specialDiscount;
    _data['discount_price'] = discountPrice;
    _data['formatted_price'] = formattedPrice;
    _data['is_game'] = isGame;
    _data['game'] = game;
   // _data['formatted_discount'] = formattedDiscount;
    _data['image'] = image;
    _data['price'] = price;
    _data['rating'] = rating;
    _data['total_reviews'] = totalReviews;
    _data['current_stock'] = currentStock;
    _data['reward'] = reward;
    _data['minimum_order_quantity'] = minimumOrderQuantity;
    _data['is_favourite'] = isFavourite;
    return _data;
  }
}