class Order {
  int? id;
  int? productId;
  int? codeId;
  int? quantity;
  int? price;
  String? status;
  String? playerName;
  int? robotId;
  String? playerId;
  int? apiId;
  String? usd;
  String? note;
  int? userId;
  String? createdAt;
  String? updatedAt;
  int? codes;

  Order(
      {this.id,
        this.productId,
        this.codeId,
        this.quantity,
        this.price,
        this.status,
        this.playerName,
        this.robotId,
        this.playerId,
        this.apiId,
        this.usd,
        this.note,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.codes});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    codeId = json['code_id'];
    quantity = json['quantity'];
    price = json['price'];
    status = json['status'];
    playerName = json['player_name'];
    robotId = json['robot_id'];
    playerId = json['player_id'];
    apiId = json['api_id'];
    usd = json['usd'];
    note = json['note'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    codes = json['codes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['code_id'] = this.codeId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['status'] = this.status;
    data['player_name'] = this.playerName;
    data['robot_id'] = this.robotId;
    data['player_id'] = this.playerId;
    data['api_id'] = this.apiId;
    data['usd'] = this.usd;
    data['note'] = this.note;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['codes'] = this.codes;
    return data;
  }
}