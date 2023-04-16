class ProductByShopModel {
  int? id;
  String? slug;
  int? isGame;
  //Null? game;
  String? title;
  String? shortDescription;
  String? specialDiscountType;
  int? specialDiscount;
  int? discountPrice;
  String? formattedPrice;
  //int? formattedDiscount;
  String? image;
  //String? price;
  int? rating;
  int? totalReviews;
  int? currentStock;
  int? reward;
  int? minimumOrderQuantity;
  bool? isFavourite;

  ProductByShopModel(
      {this.id,
        this.slug,
        this.isGame,
        //this.game,
        this.title,
        this.shortDescription,
        this.specialDiscountType,
        this.specialDiscount,
        this.discountPrice,
        this.formattedPrice,
       // this.formattedDiscount,
        this.image,
       // this.price,
        this.rating,
        this.totalReviews,
        this.currentStock,
        this.reward,
        this.minimumOrderQuantity,
        this.isFavourite});

  ProductByShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    isGame = json['is_game'];
    //game = json['game'];
    title = json['title'];
    shortDescription = json['short_description'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    formattedPrice = json['formatted_price'];
   // formattedDiscount = json['formatted_discount'];
    image = json['image'];

   // price = json['price'].toString();

    rating = json['rating'];
    totalReviews = json['total_reviews'];
    currentStock = json['current_stock'];
    reward = json['reward'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    isFavourite = json['is_favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['is_game'] = this.isGame;
    //data['game'] = this.game;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['special_discount_type'] = this.specialDiscountType;
    data['special_discount'] = this.specialDiscount;
    data['discount_price'] = this.discountPrice;
    data['formatted_price'] = this.formattedPrice;
    //data['formatted_discount'] = this.formattedDiscount;
    data['image'] = this.image;
    //data['price'] = this.price;
    data['rating'] = this.rating;
    data['total_reviews'] = this.totalReviews;
    data['current_stock'] = this.currentStock;
    data['reward'] = this.reward;
    data['minimum_order_quantity'] = this.minimumOrderQuantity;
    data['is_favourite'] = this.isFavourite;
    return data;
  }
}