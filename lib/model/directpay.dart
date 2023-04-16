
class DirectPay {
  DirectPay({
    required this.productId,
    required this.quantity,
    required this.userId,
    required this.note,
    required this.playerId,
    required this.playerName,
  });
  late final String productId;
  late final String quantity;
  late final String userId;
  late final String note;
  late final String? playerId;
  late final String? playerName;

  DirectPay.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    quantity = json['quantity'];
    userId = json['user_id'];
    note = json['note'];
    playerId = json['player_id'];
    playerName = json['player_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['quantity'] = quantity;
    _data['user_id'] = userId;
    _data['note'] = note;
    _data['player_id'] = playerId;
    _data['player_name'] = playerName;
    return _data;
  }
}