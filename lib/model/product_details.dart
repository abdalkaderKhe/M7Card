class ProductDetails {
  ProductDetails({
    required this.title,
    required this.specialDiscountType,
    required this.specialDiscount,
    required this.discountPrice,
    required this.price,
    required this.rating,
    required this.totalReviews,
    required this.currentStock,
    required this.minimumOrderQuantity,
    required this.reward,
    required this.totalImages,
    required this.images,
    required this.colors,
    required this.attributes,
    required this.specialDiscountStart,
    required this.specialDiscountEnd,
    required this.description,
    required this.isFavourite,
    required this.shortDescription,
    required this.hasVariant,
    required this.isWholesale,
    required this.specifications,
    required this.reviews,
    required this.isReviewed,
    required this.delivery,
    // required this.return,
    required this.stockVisibility,
    required this.wholesalePrices,
    required this.classifiedContactInfo,
    required this.classifiedExternalLink,
    required this.form,
  });
  late final String title;
  late final String specialDiscountType;
  late final int specialDiscount;
  late final int discountPrice;
  late final int price;
  late final int rating;
  late final int totalReviews;
  late final int currentStock;
  late final int minimumOrderQuantity;
  late final int reward;
  late final int totalImages;
  late final List<String> images;
  late final List<dynamic> colors;
  late final List<dynamic> attributes;
  late final String specialDiscountStart;
  late final String specialDiscountEnd;
  late final String description;
  late final bool isFavourite;
  late final String shortDescription;
  late final bool hasVariant;
  late final bool isWholesale;
  late final String specifications;
  late final List<dynamic> reviews;
  late final bool isReviewed;
  late final String delivery;
//late final int return;
  late final String stockVisibility;
  late final List<dynamic> wholesalePrices;
  late final List<dynamic> classifiedContactInfo;
  late final List<dynamic> classifiedExternalLink;
  late final Form form;

  ProductDetails.fromJson(Map<String, dynamic> json){
    title = json['title'];
    specialDiscountType = json['special_discount_type'];
    specialDiscount = json['special_discount'];
    discountPrice = json['discount_price'];
    price = json['price'];
    rating = json['rating'];
    totalReviews = json['total_reviews'];
    currentStock = json['current_stock'];
    minimumOrderQuantity = json['minimum_order_quantity'];
    reward = json['reward'];
    totalImages = json['total_images'];
    images = List.castFrom<dynamic, String>(json['images']);
    colors = List.castFrom<dynamic, dynamic>(json['colors']);
    attributes = List.castFrom<dynamic, dynamic>(json['attributes']);
    specialDiscountStart = json['special_discount_start'];
    specialDiscountEnd = json['special_discount_end'];
    description = json['description'];
    isFavourite = json['is_favourite'];
    shortDescription = json['short_description'];
    hasVariant = json['has_variant'];
    isWholesale = json['is_wholesale'];
    specifications = json['specifications'];
    reviews = List.castFrom<dynamic, dynamic>(json['reviews']);
    isReviewed = json['is_reviewed'];
    delivery = json['delivery'];
//return = json['return'];
    stockVisibility = json['stock_visibility'];
    wholesalePrices = List.castFrom<dynamic, dynamic>(json['wholesale_prices']);
    classifiedContactInfo = List.castFrom<dynamic, dynamic>(json['classified_contact_info']);
    classifiedExternalLink = List.castFrom<dynamic, dynamic>(json['classified_external_link']);
    form = Form.fromJson(json['form']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['special_discount_type'] = specialDiscountType;
    _data['special_discount'] = specialDiscount;
    _data['discount_price'] = discountPrice;
    _data['price'] = price;
    _data['rating'] = rating;
    _data['total_reviews'] = totalReviews;
    _data['current_stock'] = currentStock;
    _data['minimum_order_quantity'] = minimumOrderQuantity;
    _data['reward'] = reward;
    _data['total_images'] = totalImages;
    _data['images'] = images;
    _data['colors'] = colors;
    _data['attributes'] = attributes;
    _data['special_discount_start'] = specialDiscountStart;
    _data['special_discount_end'] = specialDiscountEnd;
    _data['description'] = description;
    _data['is_favourite'] = isFavourite;
    _data['short_description'] = shortDescription;
    _data['has_variant'] = hasVariant;
    _data['is_wholesale'] = isWholesale;
    _data['specifications'] = specifications;
    _data['reviews'] = reviews;
    _data['is_reviewed'] = isReviewed;
    _data['delivery'] = delivery;
    //_data['return'] = return;
    _data['stock_visibility'] = stockVisibility;
    _data['wholesale_prices'] = wholesalePrices;
    _data['classified_contact_info'] = classifiedContactInfo;
    _data['classified_external_link'] = classifiedExternalLink;
    _data['form'] = form.toJson();
    return _data;
  }
}
class Form {
  Form({
    required this.productId,
  });
  late final int productId;

  Form.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    return _data;
  }
}