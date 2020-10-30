class CartInfoModel {
  String goodsId;
  String goodsName;
  int count;
  double price;
  String images;
  bool isSelect=false;
  CartInfoModel(
      {this.goodsId,
      this.goodsName,
      this.count,
      this.price,
      this.images,
      this.isSelect});

  CartInfoModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    count = json['count'];
    price = json['price'];
    images = json['images'];
    if (json['isSelect'] != null) {
      isSelect = json['isSelect'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['images'] = this.images;
    data['isSelect'] = this.isSelect;
    return data;
  }

  @override
  String toString() {
    return super.toString();
  }
}
