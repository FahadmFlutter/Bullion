//
// class GetAssetsModel {
//   int? buyPrice;
//   int? change24H;
//   String? createdAt;
//   String? description;
//   String? id;
//   bool? isActive;
//   String? name;
//   int? sellPrice;
//   String? symbol;
//   String? updatedAt;
//
//   GetAssetsModel({this.buyPrice, this.change24H, this.createdAt, this.description, this.id, this.isActive, this.name, this.sellPrice, this.symbol, this.updatedAt});
//
//   GetAssetsModel.fromJson(Map<String, dynamic> json) {
//     if(json["buy_price"] is num) {
//       buyPrice = (json["buy_price"] as num).toInt();
//     }
//     if(json["change_24h"] is num) {
//       change24H = (json["change_24h"] as num).toInt();
//     }
//     if(json["created_at"] is String) {
//       createdAt = json["created_at"];
//     }
//     if(json["description"] is String) {
//       description = json["description"];
//     }
//     if(json["id"] is String) {
//       id = json["id"];
//     }
//     if(json["is_active"] is bool) {
//       isActive = json["is_active"];
//     }
//     if(json["name"] is String) {
//       name = json["name"];
//     }
//     if(json["sell_price"] is num) {
//       sellPrice = (json["sell_price"] as num).toInt();
//     }
//     if(json["symbol"] is String) {
//       symbol = json["symbol"];
//     }
//     if(json["updated_at"] is String) {
//       updatedAt = json["updated_at"];
//     }
//   }
//
//   static List<GetAssetsModel> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => GetAssetsModel.fromJson(map)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["buy_price"] = buyPrice;
//     _data["change_24h"] = change24H;
//     _data["created_at"] = createdAt;
//     _data["description"] = description;
//     _data["id"] = id;
//     _data["is_active"] = isActive;
//     _data["name"] = name;
//     _data["sell_price"] = sellPrice;
//     _data["symbol"] = symbol;
//     _data["updated_at"] = updatedAt;
//     return _data;
//   }
//
//   GetAssetsModel copyWith({
//     int? buyPrice,
//     int? change24H,
//     String? createdAt,
//     String? description,
//     String? id,
//     bool? isActive,
//     String? name,
//     int? sellPrice,
//     String? symbol,
//     String? updatedAt,
//   }) => GetAssetsModel(
//     buyPrice: buyPrice ?? this.buyPrice,
//     change24H: change24H ?? this.change24H,
//     createdAt: createdAt ?? this.createdAt,
//     description: description ?? this.description,
//     id: id ?? this.id,
//     isActive: isActive ?? this.isActive,
//     name: name ?? this.name,
//     sellPrice: sellPrice ?? this.sellPrice,
//     symbol: symbol ?? this.symbol,
//     updatedAt: updatedAt ?? this.updatedAt,
//   );
// }
class GetAssetsList {
  List<GetAssetsModel> assets;

  GetAssetsList({required this.assets});

  factory GetAssetsList.fromJson(List<dynamic> jsonList) {
    List<GetAssetsModel> assets = jsonList.map((json) => GetAssetsModel.fromJson(json)).toList();
    return GetAssetsList(assets: assets);
  }
}

class GetAssetsModel {
  GetAssetsModel({
    this.buyPrice,
    this.change24h,
    this.createdAt,
    this.description,
    this.id,
    this.isActive,
    this.name,
    this.sellPrice,
    this.symbol,
    this.updatedAt,
  });

  double? buyPrice;
  int? change24h;
  dynamic createdAt;
  dynamic description;
  dynamic id;
  bool? isActive;
  dynamic name;
  double? sellPrice;
  dynamic symbol;
  dynamic updatedAt;

  GetAssetsModel.fromJson(Map<String, dynamic> json) {
    buyPrice = json['buy_price'];
    change24h = json['change_24h'];
    createdAt = json['created_at'];
    description = json['description'];
    id = json['id'];
    isActive = json['is_active'];
    name = json['name'];
    sellPrice = json['sell_price'];
    symbol = json['symbol'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'buy_price': buyPrice,
      'change_24h': change24h,
      'created_at': createdAt,
      'description': description,
      'id': id,
      'is_active': isActive,
      'name': name,
      'sell_price': sellPrice,
      'symbol': symbol,
      'updated_at': updatedAt,
    };
  }
}
