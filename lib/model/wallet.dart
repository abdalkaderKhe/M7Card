class Wallet {
  int? pointCount;
  String? profileImage;
  String? userProfileImage;
  String? fullName;
  //List<Null>? shippingAddress;
  //List<Null>? billingAddress;
  int? lastRecharge;

  Wallet(
      {this.pointCount,
        this.profileImage,
        this.userProfileImage,
        this.fullName,
        //this.shippingAddress,
        //this.billingAddress,
        this.lastRecharge});

  Wallet.fromJson(Map<String, dynamic> json) {
    pointCount = json['point_count'];
    profileImage = json['profile_image'];
    userProfileImage = json['user_profile_image'];
    fullName = json['full_name'];
   // if (json['shipping_address'] != null) {shippingAddress = <Null>[];json['shipping_address'].forEach((v) {shippingAddress!.add(new Null.fromJson(v));});}
   // if (json['billing_address'] != null) {billingAddress = <Null>[];json['billing_address'].forEach((v) {billingAddress!.add(new Null.fromJson(v));})}
    lastRecharge = json['last_recharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['point_count'] = this.pointCount;
    data['profile_image'] = this.profileImage;
    data['user_profile_image'] = this.userProfileImage;
    data['full_name'] = this.fullName;
 //   if (this.shippingAddress != null) {data['shipping_address'] = this.shippingAddress!.map((v) => v.toJson()).toList();}
  //  if (this.billingAddress != null) {data['billing_address'] = this.billingAddress!.map((v) => v.toJson()).toList();}
    data['last_recharge'] = this.lastRecharge;
    return data;
  }
}