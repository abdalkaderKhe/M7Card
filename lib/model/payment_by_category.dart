class PaymentByCategory {
  PaymentByCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.paymentCategory,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String image;
  late final int paymentCategory;
  late final String createdAt;
  late final String updatedAt;

  PaymentByCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
    paymentCategory = json['payment_category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['payment_category'] = paymentCategory;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}